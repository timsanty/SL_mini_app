class FavoritesController < ApplicationController

	def search
		#displays map upon login
    end

    def nearby
    	#sends lat/long variables to SL api
    	@lat = params["position"]["lat"]
    	@lon = params["position"]["long"]

    	result =Typhoeus.get("http://www.street-lamp.com/api.php?lat=#{@lat}&lng=#{@lon}&auth=#{ENV['STREET_LAMP_KEY']}")
		response = JSON.parse(result.body)
		@barlist = response["venues"][0]["name"]
    end

    def favorites
    	#displays list of bars w/in radius w/ map from search

    end
end