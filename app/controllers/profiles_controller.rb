class ProfilesController < ApplicationController
	before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  # before_filter :url_to_lower_case

  # def url_to_lower_case
  #   params[:id] = params[:id].downcase
  # end

	def show
		@user = params[:id] ? User.friendly.find(params[:id]) : current_user
		@username = "@" + @user.username
		@posting = Posting.new
		@allpostings = Posting.all
	end

	def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


end
