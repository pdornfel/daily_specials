class Feed < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy
  
  has_many :users, through: :subscriptions

  has_many :specials



  def subscriber_emails
    users.map { |user| user.email}
  end

end