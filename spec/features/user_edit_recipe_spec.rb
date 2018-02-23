require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do
    recipe_type = RecipeType.create(name: 'Entrada')
    another_recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Japonesa')
    another_cuisine = Cuisine.create(name: 'Francesa')
    recipe = Recipe.create(title: 'Mousse de Frango', difficulty: 'Médio',
      cook_time: 15,
      ingredients: 'Água, azeite de dende, camarão',
      method: 'Frite a água e leve ao forno',
      cuisine: cuisine, recipe_type: recipe_type)

    visit root_path
    click_on recipe.title
    click_on 'Editar Receita'

    fill_in 'Título', with: 'Mousse de Maracujá'
    select another_recipe_type.name, from: 'Tipo da Receita'
    select another_cuisine.name, from: 'Cozinha'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: 5
    fill_in 'Ingredientes',
      with: 'Leite condensado, creme de leite, suco de frutas em pó'
    fill_in 'Como Preparar',
      with: 'Misture todos os ingredientes e leve para geladeira'
    click_on 'Salvar'

    expect(current_path).to eq(recipe_path(recipe.id))
    expect(page).to have_css('h1', text: 'Mousse de Maracujá')
    expect(page).to have_css('p', text: 'Sobremesa')
    expect(page).to have_css('p', text: 'Fácil')
    expect(page).to have_css('p', text: 'Francesa')
    expect(page).to have_css('p', text: '5')
    expect(page).to have_css('p',
      text: 'Leite condensado, creme de leite, suco de frutas em pó')
    expect(page).to have_css('p',
      text: 'Misture todos os ingredientes e leve para geladeira')
  end
end
