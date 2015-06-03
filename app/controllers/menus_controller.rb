class MenusController < ApplicationController
	def index
		base_url = "https://api.appery.io/rest/1/db/collections/Menu/"
		@items = HTTParty.get(base_url,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e"}).parsed_response
	end

	def new

	end

	def create
		item = params[:item]
		list_id = params[:listid]
		price = params[:price]
		num_orders = params[:num_orders]

		base_url = "https://api.appery.io/rest/1/db/collections/Menu/"
		response = HTTParty.post(base_url, 
			:body => {"item" => "#{item}", "listid" => "#{list_id}", "price" => "#{price}", "num_orders" => "#{num_orders}"}.to_json, 
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e",
				"Content-Type" => "application/json"})

		puts "response: #{response}"

		redirect_to '/'
	end
end


# ****************** NOTES **********************

#https://api.appery.io/rest/1/db/collections/Drinks/

# response = post(Accounts.root_url+"/sobjects/Account/", 
#   :body => {:name => "graham"}.to_json,
#   :headers => {'Content-Type' => 'application/json'} )
