class CreateMenuItems < ActiveRecord::Migration
  def change
  	create_table :menu_items do |t|
  		t.string :name
  		t.integer :price
  		t.string :description
  		t.string :allergens
  		t.string :course
  		t.string :meal

  		t.timestamps
  	end
  end
end
