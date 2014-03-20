require 'net/http'
require 'csv'
class MoneytagsController < ApplicationController
  respond_to :json


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

    data = YahooFinance.quotes(["#{@moneytag}"], [:ask, :bid, :low_52_weeks, :high_52_weeks, :name])

    @stock ||= @moneytag ? Stock.create(symbol: @moneytag.name.upcase, 
                                        ask: data[0].ask, 
                                        bid: data[0].bid,
                                        year_low: data[0].low_52_weeks,
                                        year_high: data[0].high_52_weeks,
                                        name: data[0].name) : Stock.find_by_symbol(params[:moneytag])
    @stocksymbol = "$" + @stock.symbol 
  end 

  def following
    @title = "Following"
    @stock = Stock.find(params[:id])
    @stocksymbol = "@" + @stock.symbol
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Following"
    @stock = Stock.find(params[:id])
    @stocksymbol = "@" + @stock.symbol
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    def stock_params
      params.require(:stock).permit(:id, :symbol, :name, :bid, :ask, :year_low, :year_high)
    end   

end