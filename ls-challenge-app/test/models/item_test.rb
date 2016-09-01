require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:merchant)
  should belong_to(:order)

  test 'Should be 1 fixture' do
    assert_not items(:meal_deal).blank?, "Fixture meal_deal should exist"
    assert_equal Item.all.count, 1, "Should be one fixture"
  end

  test 'Should not validateitem with same description' do
    i = Item.new(description: "Buy one get one for $0.01")
    assert_not i.valid?, "Item should not be valid due to uniqueness validation"
    i.save
    assert_equal Item.all.count, 1, "Should not have save the item"
  end

  test 'Should validate new Item' do
    assert_not items(:meal_deal).blank?, "Fixture meal_deal should exist"
    i = Item.new(description: "Buy one get one for $3.50")
    assert i.valid?, "New Item with different description should be validate"
    i.save
    assert_equal Item.all.count, 2, "Should have save the item"
  end
end
