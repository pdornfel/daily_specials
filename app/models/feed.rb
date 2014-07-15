class Feed < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy
  
  has_many :users, through: :subscriptions

  has_many :specials

  validates_presence_of :name, :url, :day_selector, :special_selector

  after_find :scrape_special

  def self.scrape_specials
    all.each {|feed| feed.scrape_special}
  end

  def subscriber_emails
    users.map { |user| user.email}
  end

  def latest_special
    specials.last
  end

  def previous_specials
    specials[1..-1]
  end

  def subscriber_count
    users.count
  end

  def scrape_special
    if specials.from_today.empty?
      doc = Nokogiri::HTML(open(url))
      day = doc.css(day_selector).text
      special = doc.css(special_selector).text
      specials << Special.create(description: special, day_description: day )
    end
  end

end