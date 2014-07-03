
class SqueakyBeaker

  attr_accessor :day, :special

  def initialize
  end

  def get_special_from_web
    doc = Nokogiri::HTML(open('http://www.squeakybeaker.com/'))
    @day = doc.css('#post-23 > div > div > div > h4:nth-child(3) > span').text
    @special = doc.css('#post-23 > div > div > div > p:nth-child(4)').text
  end

  def populate_special_table
    feed = Feed.find_by_name('Squeaky Beaker')
    Special.find_or_create_by(feed: feed, description: @special, day_description: @day)
  end

end


