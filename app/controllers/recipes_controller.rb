class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find id
  end

  def new
    @recipe = Recipe.new
  end

  def create
    #Forma mais segura de pegar os parâmetros, para evitar que alguém envie parâmetros que não existem.
    #recipe_params = params.require(:recipe).permit(:title, :recipe_type, :cuisine,
    #	:cook_time, :ingredients, :method)
    #@recipe = Recipe.new(recipe_params)
    #recipe.save
    #redirect_to recipe_path recipe.id

=begin
    #OU

    recipe = params[:recipe]
    titulo = recipe[:title]
    tipo = recipe[:recipe_type]
    cozinha = recipe[:cuisine_id]
    dificuldade = recipe[:difficulty]
    tempo = recipe[:cook_time]
    ingredientes = recipe[:ingredients]
    preparo = recipe[:method]

    recipe = Recipe.new(title: titulo, recipe_type: tipo, cuisine_id: cozinha, difficulty: dificuldade,
          cook_time: tempo, ingredients: ingredientes, method: preparo)
=end

    recipe_params = params.require(:recipe).permit(:title, :cuisine_id,
      :recipe_type_id, :cook_time, :ingredients, :method, :difficulty)
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      #redirect_to recipe_path recipe   OU
      redirect_to recipe_path @recipe.id
    else
      flash[:notice] = 'Você deve informar todos os dados da receita'
      render :new
    end
  end

end
