class CreateParties < ActiveRecord::Migration
  def change
  	create_table :parties do |t|
  		t.string :name
  		t.integer :number_people
  		t.string :table_name
  		t.boolean :paid

  		t.timestamps
  	end
  end
end
