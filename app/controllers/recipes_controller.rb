class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find_by id: id

    if @recipe.nil?
      flash[:alert] = 'Receita não encontrada'
      redirect_to root_path
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create

    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
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

  def edit
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def update
    id = params[:id]
    recipe_params = params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
      :cook_time, :ingredients, :method, :difficulty)
    recipe = Recipe.find(id)
    recipe.update(recipe_params)

    redirect_to recipe_path recipe
  end

  def destroy
    id = params[:id]
    recipe = Recipe.find(id)

    recipe.delete

    redirect_to root_path
  end

  def search
    @search = params[:search]
    @recipes = Recipe.where("title LIKE '%#{@search}%'")
  end

end
