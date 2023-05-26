class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[public_recipe index]
  load_and_authorize_resource

  def index
    @user = User.find(current_user.id)
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.public && @recipe.user != current_user
      redirect_to recipes_path, alert: "You are not authorized to view this recipe."
    end
  end

  def public_recipe
    @recipes = Recipe.where(public: true)
  end

  def new
    @recipe = current_user.recipes.build
    @foods = Food.all
  end

  def create
    @recipe = current_user.recipes.build(params.require(:recipe).permit(:name, :description, :public,
                                                                        :preparation_time, :cooking_time))
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
