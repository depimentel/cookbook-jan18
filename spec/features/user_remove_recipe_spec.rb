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
    click_on 'Excluir Receita'

    expect(current_path).to eq(root_path)
    expect(page).not_to have_content('Brigadeiro')
  end

  scenario 'and recipe is not listed on index' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Brigadeiro', difficulty: 'Fácil', cook_time: 400,
      ingredients: 'Chocolate, leite condensado, açucar',
      method: 'Mistura tudo e poe no fogo', recipe_type: recipe_type,
      cuisine: cuisine)

    visit root_path
    click_on 'Brigadeiro'
    click_on 'Excluir Receita'

    visit recipe_path(recipe)

    expect(page).to have_content('Receita não encontrada')
  end
end
