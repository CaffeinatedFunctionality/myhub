class AddStockInfoToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :bid, :decimal, precision: 4
    add_column :stocks, :ask, :decimal, precision: 4
    add_column :stocks, :year_high, :decimal, precision: 4
    add_column :stocks, :year_low, :decimal, precision: 4
  end
end
