class Order < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :merchant
  has_one    :item

  def self.import_file(file)
    # Empty array to store the total revenue of each row
    revenue_of_orders_arr = []
    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      revenue_of_orders_arr << row['item price'].to_f * row['purchase count'].to_i
      p = Purchaser.new(name: row['purchaser name'])
      p.save
      m = Merchant.find_or_create_by(address: row['merchant address'], name: row['merchant name'])
      o = Order.new(purchase_count: row['purchase count'], purchaser_id: p.id, merchant_id: m.id)
      o.save
      i = Item.new(description: row['item description'], price: row['item price'], order_id: o.id, merchant_id: m.id)
      i.save
    end
    revenue_of_orders_arr.inject(:+)
  end
end
