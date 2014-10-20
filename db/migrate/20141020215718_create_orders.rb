class CreateOrders < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
  		t.integer :party_id
  		t.integer :menu_item_id
  		t.string :notes
  		t.boolean :queue
  		t.integer :price_change
  		t.string :price_change_notes
  		t.timestamp :start_time

  		t.timestamps
  	end
  end
end
