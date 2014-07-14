
class Special < ActiveRecord::Base

  belongs_to :feed
  belongs_to :subscription

  def from_today?
    created_at.to_date == Date.today
  end


end