class ProfilesController < ApplicationController

def show
	@user = User.find(params[:id])
	@alias = User.find(params[:id]).alias
	

end
