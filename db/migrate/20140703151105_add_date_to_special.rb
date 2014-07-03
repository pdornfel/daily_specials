class AddDateToSpecial < ActiveRecord::Migration
  def change
    add_column :specials, :day_description, :string
  end
end
