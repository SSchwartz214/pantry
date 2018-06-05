require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test
  def test_it_has_a_name
    recipe = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", recipe.name
  end

  def test_it_starts_with_no_ingredients
    recipe = Recipe.new("Cheese Pizza")
    assert_equal ({}), recipe.ingredients
  end

  def test_it_can_add_an_ingredient
    recipe = Recipe.new("Cheese Pizza")

    recipe.add_ingredient("Flour", 20)
    recipe.add_ingredient("Cheese", 20)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), recipe.ingredients
  end

  def test_it_tracks_amount_of_a_recipe_required
    recipe = Recipe.new("Cheese Pizza")
    recipe.add_ingredient("Flour", 500)
    assert_equal 500, recipe.amount_required("Flour")
  end

end
