require 'rails_helper'

feature 'User remove a recipe' do
  scenario 'successfully' do
    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Feijoada carioca', difficulty: 'Hard', cook_time: 400,
      ingredients: 'Feijão, paio, costela',
      method: 'Mistura tudo com água e poe no fogo', recipe_type: recipe_type,
      cuisine: cuisine)

    visit root_path
    click_on 'Feijoada carioca'
    
  end
end
