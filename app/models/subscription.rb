class Subscription < ActiveRecord::Base

	belongs_to :user,
		inverse_of: :subscriptions

	belongs_to :feed,
		inverse_of: :subscriptions

	validates_presence_of :user
	validates_presence_of :feed


end