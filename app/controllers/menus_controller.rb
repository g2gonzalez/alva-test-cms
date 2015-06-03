class MenusController < ApplicationController
	def index
		base_url = "https://api.appery.io/rest/1/db/collections/Menu/"

		# get request to retrieve data
		@items = HTTParty.get(base_url,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e"}).parsed_response
	end

	def new
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
end


# ****************** NOTES **********************

#https://api.appery.io/rest/1/db/collections/Drinks/

# response = post(Accounts.root_url+"/sobjects/Account/", 
#   :body => {:name => "graham"}.to_json,
#   :headers => {'Content-Type' => 'application/json'} )
