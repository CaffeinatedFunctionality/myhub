class AddStockInfoToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :bid, :decimal
    add_column :stocks, :ask, :decimal
    add_column :stocks, :year_high, :decimal
    add_column :stocks, :year_low, :decimal
  end
end
