class FavoritesController < ApplicationController
	 def search
 		# if lat/long params set from pin, send to SL api and return venue info to search page
 		 if params[:lat] && params[:lng]
  			 @lat = params[:lat]
  	   @lng = params[:lng]

  	   result = Typhoeus.get("http://www.street-lamp.com/api.php?lat=#{@lat}&lng=#{@lng}&auth=#{ENV['STREET_LAMP_KEY']}")
  			 response = JSON.parse(result.body)
  			 @barlist = response['venues'][0...10]
  		else
  			 @barlist = []
  		end
     end

  def index
  	 @favorites = Favorite.where(user_id: current_user.id)
  end

  def favorites
  	# displays list of bars added to favorite db
  	 @favorite = Favorite.new
  	 @favorite.name = params['name']
  	 @favorite.user_id = current_user.id
  	 @favorite.save

  	 session[:return_to] ||= request.referer
  	 @favorites = params
  	 flash[:success] = 'venue added to favorites!'
  	 redirect_to session.delete(:return_to)
 end
end
