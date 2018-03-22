class RecipeTypesController < ApplicationController
  def new
    @recipe_type = RecipeType.new
  end

  def create
    name = params[:recipe_type][:name]
    #recipe_type_params = params.require(:recipe_type).permit(:name)
    @recipe_type = RecipeType.new(name: name)

    if @recipe_type.save
      redirect_to @recipe_type
    else
      flash[:notice] = 'Você deve informar o nome do tipo de receita'
      render :new
    end
  end

  def show
    @recipe_type = RecipeType.find(params[:id])
  end
end
