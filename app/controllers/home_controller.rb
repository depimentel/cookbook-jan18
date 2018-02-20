class HomeController < ApplicationController

  def index
    @cuisines = Cuisine.all
    @recipes = Recipe.all
  end
end
