
class Special < ActiveRecord::Base

  belongs_to :feed
  belongs_to :subscription

  delegate :name, :url,  :to => :feed, :prefix => true


  def self.from_today
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

end