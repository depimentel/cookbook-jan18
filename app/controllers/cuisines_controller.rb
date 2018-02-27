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
    @cuisine = Cuisine.new name_params
    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:notice] = 'Não foi possível criar a cozinha'
      render :new
    end
  end
end
