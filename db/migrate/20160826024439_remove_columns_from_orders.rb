class RemoveColumnsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :purchaser_name, :string
    remove_column :orders, :item_description, :string
    remove_column :orders, :item_price, :float
    remove_column :orders, :merchant_address, :string
    remove_column :orders, :merchant_name, :string
  end
end
