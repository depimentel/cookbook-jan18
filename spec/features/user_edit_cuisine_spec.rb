require 'rails_helper'

feature 'User edit cuisine' do
  scenario 'sucessfully' do
    cuisine = Cuisine.create(name: 'Do mar')

    visit root_path
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Name', with: 'Chinesa'
    click_on 'Salvar'

    expect(page).to have_content('Chinesa')
    expect(current_path).to eq(root_path)
    expect(page).to has_no_content(cuisine.name)
  end

  scenario 'and must fill in name' do
    cuisine = Cuisine.create(name: 'Europeia')

    visit root_path
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Name', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
    expect(current_path).to eq(root_path)
  end

  scenario 'and dont allow duplicate name' do
    cuisine = Cuisine.create(name: 'Italiana')

    visit root_path
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Name', with: cuisine.name
    click_on 'Salvar'

    expect(page).to have_content('Já existe uma cozinha cadastrada com o mesmo nome')
    expect(page).to have_content('Editar')
  end

end