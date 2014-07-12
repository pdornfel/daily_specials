class User < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy

  has_many :feeds, through: :subscriptions

  validates :email, :phone_number, presence: true

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates_format_of :phone_number, with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/


end