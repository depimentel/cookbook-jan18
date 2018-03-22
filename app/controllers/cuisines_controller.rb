class CuisinesController < ApplicationController
  def show
    id = params[:id]
    @cuisine = Cuisine.find id
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    #cuisine_params = params.require(:cuisine).permit(:name)
    #@cuisine = Cuisine.new(cuisine_params)
    name = params[:cuisine][:name]
    @cuisine = Cuisine.new(name: name)

    if @cuisine.save
      #redirect_to cuisine_path @cuisine.id
      #redirect_to cuisine_path @cuisine
      redirect_to @cuisine
      #redirect_to root_path
    else
      flash[:notice] = 'Você deve informar o nome da cozinha'
      #render :new   #Não pode dar redirect, o render só reendeniza a view e não perde os valores das variáveis
      render :new
    end

    #@exception = cuisine.errors.message
#    @exception = cuisine.errors.details[:name]
#    puts @exception.erros.any?
    #puts @exception


  end
end
