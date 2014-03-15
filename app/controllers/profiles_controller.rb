class ProfilesController < ApplicationController
	before_action :user_signed_in?,
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
    if signed_in?
      @posts  = current_user.postings.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
	end

	def following
    @title = "Following"
    @user = params[:id] ? User.friendly.find(params[:id]) : current_user
    @username = "@" + @user.username
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = params[:id] ? User.friendly.find(params[:id]) : current_user
    @username = "@" + @user.username
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


end
