require 'test_helper'

class PurchaserTest < ActiveSupport::TestCase
  should have_many(:orders)
end
