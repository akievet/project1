class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:menu_items, :through => :orders)

	def total_price
		total_array= []
		total_array << self.menu_items.map { |item| item.price}
		comps= self.orders.map {|order| order.price_change}
		total_array << comps.select {|x| x != nil}
		total_array.flatten!
		total= total_array.inject{|sum,x| sum + x}
	end
end