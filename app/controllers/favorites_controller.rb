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
				message = "please drop a pin!"
				puts message
			end
		end
    end

    def nearby
    end

    def favorites
    	#displays list of bars added to favorite db
    	@favorites = params
  	end


  
    private
	    def favorite_params
	      params.require(:user_id).permit(:name)
	    end
	
end


