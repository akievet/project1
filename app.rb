require 'bundler'
Bundler.require

require_relative 'connection'

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/models/*.rb"].each{ |file| require file}





get '/' do 
	erb :index
end

get '/menu_items' do
	@sorted = {}
	courses=['Salumi, Etc', 'Market/Garden', 'Kitchen', 'Pizza', 'Pizza Toppings',
		'Sandwiches', 'Pasta', 'Bakery/Pastry', 'Brunch', 'Alcoholic Drinks', 
		'Non-Alcoholic Drinks']
		courses.each do |course|
			@sorted[course] = MenuItem.where(course: course)
		end
		erb :"menu_items/index" 
	end

# Display a form for a new menu item
get '/menu_items/new' do
	erb :"menu_items/new"
end

# Display a single menu item
get '/menu_items/:id' do
	@menu_item= MenuItem.find(params[:id])
	erb :"menu_items/show"
end

#Creats a new menu item
post '/menu_items' do
	item= MenuItem.create(params[:menu_item])
	if item.valid?
		redirect '/menu_items'
	else
		@errors = item.errors.full_messages
		erb :"menu_items/new"
	end
end

# Display a form to edit a menu item
get '/menu_items/:id/edit' do 
	@menu_item= MenuItem.find(params[:id])
	erb :"menu_items/edit"
end

#Updates a menu item
patch '/menu_items/:id' do 
	menu_item= MenuItem.find(params[:id])
	menu_item.update(params[:menu_item])
	redirect "/menu_items/#{menu_item.id}"
end

# Deletes a menu item
delete '/menu_items/:id' do 
	@menu_item= MenuItem.find(params[:id])
	MenuItem.destroy(params[:id])
	redirect "/menu_items"
end

# Display a list of all OPEN parties 
## (parties who have at least one non-paid order)
get '/parties' do 
	@parties= Party.where(paid: false)
	erb :"parties/index"
end

#Display a form for a new party
get '/parties/new' do
	erb :"parties/new"
end

#creates a new party
post '/parties' do
	Party.create({name: params['name'], number_people: params['number_people'], 
		table_name: params['table_name'], paid: false})
	redirect '/parties'
end

# Display a single party and all the menu items they've ordered 
# link to add a new order to that party
get '/parties/:id' do
	@party= Party.find(params[:id])
	@orders= @party.orders
	erb :"parties/show"
end

# Display a form to edit a party's details
get '/parties/:id/edit' do 
	@party= Party.find(params[:id])
	erb :"parties/edit"
end

# Update a party's details
patch '/parties/:id' do 
	party= Party.find(params[:id])
	party.update(params[:party])
	redirect "/parties/#{party.id}"
end

# Delete a party <--  NOT THE SAME AS MARKING AS CLOSED AND MOVING TO CLOSED ORDERS
delete '/parties/:id' do
	Party.destroy(params[:id])
	redirect '/parties'
end


# Displays a form for a new order
get '/parties/:id/orders/new' do
	@party= Party.find(params[:id]) 
	@sorted = {}
	courses=['Salumi, Etc', 'Market/Garden', 'Kitchen', 'Pizza', 'Pizza Toppings',
		'Sandwiches', 'Pasta', 'Bakery/Pastry', 'Brunch', 'Alcoholic Drinks', 
		'Non-Alcoholic Drinks']
		courses.each do |course|
			@sorted[course] = MenuItem.where(course: course)
		end
	# @menu_items= MenuItem.all 
	erb :"orders/new"
end

# Creates a new order for the party
post '/parties/:id/orders' do
	party= Party.find(params[:id])
	menu_item= MenuItem.find(params['menu_item'])
	order= Order.create({party_id: party.id, 
		menu_item_id: menu_item.id, queue: true,
		price_change: 0, price_change_note: menu_item.name, created_at: params['created_at']})
	redirect "/parties/#{party.id}"
end

# Display a single order 
get '/parties/:id/orders/:order_id' do
	@order= Order.find(params[:order_id])
	@menu_item= MenuItem.find(@order.menu_item_id)
	@party= Party.find(params[:id])
	erb :"orders/show"
end

# Display a form to edit the order details ['notes', 'change queue', 'etc']
get '/parties/:id/orders/:order_id/edit' do
	@party= Party.find(params[:id])
	@order= Order.find(params[:order_id])
	erb :"orders/edit"
end

# Updates the order's details
patch '/parties/:id/orders/:order_id' do
	party=Party.find(params[:id])
	order=Order.find(params[:order_id])
	price_change= params[:order][:price_change]
	if price_change == nil
		price_change = params[:other_amount]
	end
	order.update(params[:order])
	redirect "/parties/#{party.id}/orders/#{order.id}"
end

# Removes an order
delete '/parties/:id/orders/:order_id' do
	party= Party.find(params[:id])
	Order.destroy(params[:order_id])
	redirect "/parties/#{party.id}"
end

# Saves the party's receipt data to a file.
# Displays the content of the receipt.
# Offer the file for download
get '/parties/:id/receipt' do
	@party= Party.find(params[:id])
	@orders= @party.orders
	erb :"parties/receipt" 
end

# Marks the party as paid
patch '/parties/:id/checkout' do
	party=Party.find(params[:id])
	party.update({paid: true})
	redirect "/parties"
end

# Display list of paid tables
get '/closed' do 
	@parties= Party.where(paid: true)
	erb :"closed/index"
end

get '/closed/:id' do
	@party= Party.find(params[:id])
	@orders= @party.orders

	erb :"closed/show"
end

# Display 
get '/chefs' do
	@orders= Order.where(queue: true)
	erb :"chefs/index"
end

patch '/chefs/:id' do
	order= Order.find(params[:id])
	order.update({queue: false})
	redirect '/chefs'
end






















