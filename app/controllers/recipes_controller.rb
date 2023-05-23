class RecipesController < ApplicationController
    def index
        # @recipes = Recipe.all
        recipes = 'List of recipes'
    end

    def show
        # @recipe = Recipe.find(params[:id])
        recipe = 'Recipe details'
    end

    def destroy
        @recipe = Recipe.find(params[:id], current_user)
        @recipe.destroy
        redirect_to recipes_path
    end
end
