class ProfilesController < ApplicationController

	def show
		if params[:id].nil? # if there is no user id in params, show current one
		  @user = current_user
		else
		  @user = User.find(params[:id])
		end
		@alias = @user.alias
		@posting = Posting.new
	end

end
