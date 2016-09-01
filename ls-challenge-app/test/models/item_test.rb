require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:merchant)
  should belong_to(:order)
end
