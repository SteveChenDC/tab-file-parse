class Order < ActiveRecord::Base
  def self.import(file)
    # Empty array to store the total revenue of each row
    orders_arr = []
    CSV.foreach(file.path, headers: true, col_sep: "\t") do |row|
      transformed_row = row.to_hash.transform_keys! { |key| key.to_s.gsub(' ', '_') }
      orders_arr << transformed_row['item_price'].to_f * transformed_row['purchase_count'].to_i
      Order.create! transformed_row
    end
    orders_arr.inject(0, :+).to_s
  end
end
