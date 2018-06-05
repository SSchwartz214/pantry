class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = []
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

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  def what_can_i_make
    @cookbook.inject([]) do |array, recipe|
      if enough_ingredients?(recipe)
        array << recipe.name
      end
      array
    end
  end

  def enough_ingredients?(recipe)
    recipe.ingredients.all? do |ing_type, amount|
      @stock[ing_type] >= amount
    end
  end
end
