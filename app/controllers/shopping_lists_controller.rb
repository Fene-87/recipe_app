class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_lists = create_shopping_list(@recipe)
  end

  private

  def create_shopping_list(recipe)
    shopping_list = {}

    recipe.recipe_foods.each do |recipe_food|
      food = recipe_food.food
      quantity = recipe_food.quantity

      if shopping_list[food.name]
        shopping_list[food.name] += " #{quantity}"
      else
        shopping_list[food.name] = quantity
      end
    end

    shopping_list
  end
end
