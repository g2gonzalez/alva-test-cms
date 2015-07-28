class MenusController < ApplicationController

	before_filter :authorize

	def index
		base_url = "https://api.appery.io/rest/1/db/collections/Menu/"

		# get request to retrieve data
		@items = HTTParty.get(base_url,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e"}).parsed_response
	end

	def show
	end

	def new
	end

	def edit
		# grab item id that needs to be edited
		id = params[:id]

		base_url = "https://api.appery.io/rest/1/db/collections/Menu/#{id}"

		# grab item selected information
		@items = HTTParty.get(base_url,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e"}).parsed_response
	end

	def create
		# grab item params to be added in post request below
		item = params[:item]
		list_id = params[:listid]
		price = params[:price]
		num_orders = params[:num_orders]

		# post request to add new item
		base_url = "https://api.appery.io/rest/1/db/collections/Menu/"

		response = HTTParty.post(base_url,
			:body => {"item" => "#{item}", "listid" => "#{list_id}", "price" => "#{price}", "num_orders" => "#{num_orders}"}.to_json,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e",
				"Content-Type" => "application/json"})

		# after request redirect user back to home page
		redirect_to '/'
	end

	def update
		# grab item params to be added in put request below
		id = params[:id]
		item = params[:menu][:item]
		list_id = params[:menu][:listid]
		num_orders = params[:menu][:num_orders]
		price = params[:menu][:price]

		# put request to add new item
		base_url = "https://api.appery.io/rest/1/db/collections/Menu/#{id}"

		response = HTTParty.put(base_url,
			:body => {"item" => "#{item}", "listid" => "list_id", "num_orders" => "num_orders", "price" => "price"}.to_json,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e",
				"Content-Type" => "application/json"})

		# after request redirect user back to home page
		redirect_to '/'
	end

	def destroy
		#grab item information that needs to be deleted
  		id = params[:id]
  		base_url = "https://api.appery.io/rest/1/db/collections/Menu/#{id}"

  		HTTParty.delete(base_url, :body => {"id" => "#{id}"}.to_json,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e",
				"Content-Type" => "application/json"})

  		redirect_to '/'
	end

end


# ****************** NOTES **********************

#https://api.appery.io/rest/1/db/collections/Drinks/

# response = post(Accounts.root_url+"/sobjects/Account/",
#   :body => {:name => "graham"}.to_json,
#   :headers => {'Content-Type' => 'application/json'} )

#556d473fe4b0b40eb778a1ab

