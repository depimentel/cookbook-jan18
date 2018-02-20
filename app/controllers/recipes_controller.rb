class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new
  end

  def create

    recipe_params = params.require(:recipe).permit(:title, :recipe_type, :cuisine_id,
                                                  :cook_time, :ingredients, :method,
                                                  :difficulty)

    @recipe = Recipe.new(recipe_params)

    #@recipe.title = params[:recipe][:title]
    #@recipe.recipe_type = params[:recipe][:recipe_type]
    #@recipe.cuisine = params[:recipe][:cuisine]
    #@recipe.difficulty = params[:recipe][:difficulty]
    #@recipe.cook_time = params[:recipe][:cook_time]
    #@recipe.ingredients = params[:recipe][:ingredients]
    #@recipe.method = params[:recipe][:method]

    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      flash[:notice] = 'Você deve informar todos os dados da receita'
      render :new
    end


  end
end
