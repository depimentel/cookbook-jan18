class CuisinesController < ApplicationController
  def show
    id = params[:id]
    @cuisine = Cuisine.find(id)
    @recipes = @cuisine.recipes
  end
end
