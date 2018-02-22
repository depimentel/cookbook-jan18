class HomeController < ApplicationController

  def index
    @cuisines = Cuisine.all
    @recipes = Recipe.all
    @recipe_types = RecipeType.all
  end
end
