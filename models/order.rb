class Order < ActiveRecord::Base
	belongs_to(:menu_item)
	belongs_to(:party)

	def to_s
		#list the title and price of the menu item
		menu_item= MenuItem.find(menu_item_id)
		"#{menu_item.name} ....... #{menu_item.price}"
	end
end