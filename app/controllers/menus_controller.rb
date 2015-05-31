class MenusController < ApplicationController
	def index
		base_url = 'https://api.appery.io/rest/1/db/collections/Menu/'
		@items = HTTParty.get(base_url,
			:headers => {"X-Appery-Database-Id" => "5476a8c5e4b05e4a44a69b0e"}).parsed_response
	end
end


#https://api.appery.io/rest/1/db/collections/Drinks/