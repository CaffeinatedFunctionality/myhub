class ChangePercentChangeInStocks < ActiveRecord::Migration
  def change
    change_column :stocks, :percent_change, :string
  end
end
