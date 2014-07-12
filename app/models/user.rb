class User < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy

  has_many :feeds, through: :subscriptions


end