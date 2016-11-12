class Item < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :order

  validates :description, uniqueness: true
end
