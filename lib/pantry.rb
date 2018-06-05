class Pantry
  attr_reader :stock,
              :shopping_list

  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, amount)
    @stock[item] += amount
  end

  def add_to_shopping_list(recipe)
    ingredients = recipe.ingredients
    ingredients.inject(@shopping_list) do |hash, ingredient|
      hash[ingredient[0]] += ingredient[1]
    hash
    end
  end

  def print_shopping_list
    list = @shopping_list.map do |ingredient_type, amount|
      "* #{ingredient_type}: #{amount}"
    end
    list.join("\n")
  end

end
