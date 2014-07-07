class Subscription < ActiveRecord::Base

	belongs_to :user
	belongs_to :feed
  belongs_to :special

	validates_presence_of :user
	validates_presence_of :feed

	validates_uniqueness_of :user_id, :scope => :feed_id, message: "Subscription already exists"


  def get_todays_special
    feed.specials.last
  end


end