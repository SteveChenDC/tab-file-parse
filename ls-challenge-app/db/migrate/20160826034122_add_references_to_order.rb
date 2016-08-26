class AddReferencesToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :purchaser, index: true, foreign_key: true
    add_reference :orders, :merchant, index: true, foreign_key: true
  end
end
