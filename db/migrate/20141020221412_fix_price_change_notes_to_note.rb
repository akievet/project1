class FixPriceChangeNotesToNote < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.rename :price_change_notes, :price_change_note
  	end
  end
end
