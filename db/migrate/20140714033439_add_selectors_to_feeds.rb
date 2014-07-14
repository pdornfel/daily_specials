class AddSelectorsToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :day_selector, :string
    add_column :feeds, :special_selector, :string
  end
end
