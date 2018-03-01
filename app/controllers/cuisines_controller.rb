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

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Cuisine.find(params[:id])
    name_param = params.require(:cuisine).permit(:name)

    if @cuisine.update(name_param)
      redirect_to root_path
    else
      #flash[:notice] = 'Você deve informar o nome da cozinha'
      render :edit
    end
  end
end
