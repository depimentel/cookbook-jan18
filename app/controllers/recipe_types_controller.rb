class RecipeTypesController < ApplicationController
  def show
    id = params[:id]
    @recipe_types = RecipeType.find(id)
  end
end
