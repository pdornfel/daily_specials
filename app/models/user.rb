class User < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy

  has_many :feeds, through: :subscriptions

  validates :email, :phone_number, presence: true

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates_format_of :phone_number, with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/

  def self.send_emails
    all.each {|user| user.send_email}
  end

  def self.send_texts
    all.each {|user| user.send_text}
  end

  def send_text
    TwilioHelper.new.text_specials(self)
  end

  def send_email
    UserMailer.email_specials(self).deliver
  end

  def latest_specials
    feeds.map(&:latest_special)
  end

end