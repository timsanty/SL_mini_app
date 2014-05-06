class UsersController < ApplicationController
	def show
		@user = current_user
	end

#need post route to save info from submit button
#index method will call on saved lat long to produce radius
#radius will be sent to SL to retrieve info on venues within radius



	def index(results, current_location) 
		# current_location = {lat: 37.767182 , long: -122.5} #need to set as lat/long variables
		# results = my_results[] #need to populate with SL Api data

		# results.each do |x,y| 
		# squareroot(x - lat:)** + (y - :long)** 
		# end 
		# @bar_list = my_results.proximity_sort 
 	end 
end
