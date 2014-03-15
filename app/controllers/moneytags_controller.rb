class MoneytagsController < ApplicationController
  def index
    @moneytags = Supertag::Moneytag.all
  end

  def show
    @moneytag = Supertag::Moneytag.find_by_name(params[:moneytag])
    @moneytagged = @moneytag.moneytaggables if @moneytag
  	@user = params[:id] ? User.friendly.find(params[:id]) : current_user
  	@username = "@" + @user.username
  	@posting = Posting.new
  	@allpostings = Posting.all
  	@stock = "$" + @moneytag.name.upcase
  end 
end