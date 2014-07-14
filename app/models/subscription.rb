class Subscription < ActiveRecord::Base

	belongs_to :user
	belongs_to :feed

	validates_presence_of :user
	validates_presence_of :feed

	validates_uniqueness_of :user_id, :scope => :feed_id, message: "Subscription already exists"

  delegate :latest_special, :to => :feed


end