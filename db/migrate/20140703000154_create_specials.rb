class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
    	t.integer :feed_id
    	t.string :description
    	t.timestamps
    end
  end
end
