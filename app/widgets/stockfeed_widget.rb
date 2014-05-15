class StockfeedWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_posting

  def display
    @data = YahooFinance.quotes([params[:moneytag]], [:ask, :bid, :name, :low_52_weeks, :high_52_weeks, :symbol, :change_in_percent])
    @allpostings = Posting.all
    # @stock ||= Stock.create(symbol: @data[0].symbol.gsub(/"/,''), 
    #                         ask: @data[0].ask, 
    #                         bid: @data[0].bid, 
    #                         name: @data[0].name.gsub(/"/,''),
    #                         year_low: @data[0].low_52_weeks,
    #                         year_high: @data[0].high_52_weeks,
    #                         percent_change: @data[0].change_in_percent.gsub(/"/,''))
    # @stocksymbol = "$" + @stock.symbol
    render
  end

  def process_posting(evt)
    Posting.new(:text => evt[:text]).save

    @postings = Posting.all
    replace :view => :display
  end  

end
