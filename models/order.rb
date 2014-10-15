class Order < ActiveRecord::Base
	belongs_to(:menu_item)
	belongs_to(:party)

	def to_s
		#list the title and price of the menu item
		menu_item= MenuItem.find(menu_item_id)
		"#{menu_item.name} ....... #{menu_item.price}"
	end

	def item_name
		menu_item= MenuItem.find(menu_item_id)
		"#{menu_item.name}"
	end

	def item_price
		menu_item= MenuItem.find(menu_item_id)
		"#{menu_item.price}"
	end

	def no_charge
		menu_item= MenuItem.find(menu_item_id)
		discount= -(menu_item.price)
		self.update({price_change: discount})
	end
end