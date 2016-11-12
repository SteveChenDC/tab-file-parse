require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  should have_one(:item)
  should belong_to(:purchaser)
  should belong_to(:merchant)
end
