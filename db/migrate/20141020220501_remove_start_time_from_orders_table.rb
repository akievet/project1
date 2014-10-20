class RemoveStartTimeFromOrdersTable < ActiveRecord::Migration
  def change
  	change_table(:orders) do |t|
  		t.remove :start_time
  	end
  end
end
