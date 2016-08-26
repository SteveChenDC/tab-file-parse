class Order < ActiveRecord::Base
  def self.import_file(file)
    # Empty array to store the total revenue of each row
    revenue_of_orders_arr = []
    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      revenue_of_orders_arr << row['item price'].to_f * row['purchase count'].to_i
      Order.create(purchaser_name: row['purchaser name'], item_description: row['item description'], item_price: row['item price'],
      purchase_count: row['purchase count'], merchant_address: row['merchant address'], merchant_name: row['merchant name'])
    end
    revenue_of_orders_arr.inject(:+)
  end
end
