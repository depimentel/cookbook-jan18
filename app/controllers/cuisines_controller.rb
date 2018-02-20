class CuisinesController < ApplicationController
  def show
    id = params[:id]
    @cuisine = Cuisine.find(id)
    @recipes = @cuisine.recipes
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    name_params = params.require(:cuisine).permit(:name)
    cuisine = Cuisine.new name_params

    cuisine.save

    redirect_to cuisine_path cuisine
  end
end
