class Merchant < ActiveRecord::Base
  has_many :orders
  has_many :items
end
