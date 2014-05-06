class FavoritesController < ApplicationController

	def search
		#displays map upon login
	if params["position"]
		if params["position"]["lat"]!=''
			@lat = params["position"]["lat"] 
	    	@lon = params["position"]["long"]

	    	result =Typhoeus.get("http://www.street-lamp.com/api.php?lat=#{@lat}&lng=#{@lon}&auth=#{ENV['STREET_LAMP_KEY']}")
			response = JSON.parse(result.body)
			@barlist = response["venues"]
		else
			"please drop a pin!"
		end
	end

    end

    def favorites
    	#displays list of bars w/in radius w/ map from search

    end
end


