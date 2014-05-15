class AddPercentChangeToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :percent_change, :decimal, :precision => 2
  end
end
