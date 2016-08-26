class Order < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :merchant
  has_one    :item

  def self.import_file(file)
    # Empty array to store the total revenue of each row
    revenue_of_orders_arr = []
    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      revenue_of_orders_arr << row['item price'].to_f * row['purchase count'].to_i
      Purchaser.create(name: row['purchaser name'])
      Merchant.create(address: row['merchant address'], name: row['merchant name'])
      Item.create(description: row['item description'], price: row['item price'])
      Order.create(purchase_count: row['purchase count'])
    end
    revenue_of_orders_arr.inject(:+)
  end
end
