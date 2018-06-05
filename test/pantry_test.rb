require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_starts_with_no_stock
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_it_can_check_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end


end

#
# pantry.restock("Cheese", 10)
# pantry.stock_check("Cheese")
# # => 10
#
# pantry.restock("Cheese", 20)
# pantry.stock_check("Cheese")
# # => 30
