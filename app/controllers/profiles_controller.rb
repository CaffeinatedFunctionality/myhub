class ProfilesController < ApplicationController

	def show
		@user = params[:id] ? User.friendly.find(params[:id]) : current_user
  	@username = "@" + @user.username
		@posting = Posting.new
		@allpostings = Posting.all
	end

end
