class Subscription < ActiveRecord::Base

	belongs_to :user
	belongs_to :feed

	validates_presence_of :user
	validates_presence_of :feed

	validates_uniqueness_of :user_id, message: "Subscription already exists"


end