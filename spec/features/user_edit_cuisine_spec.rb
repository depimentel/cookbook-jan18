require 'rails_helper'

feature 'User edit cuisine' do
  scenario 'sucessfully' do
    cuisine = Cuisine.create(name: 'Do mar')

    visit root_path
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Nome', with: 'Chinesa'
    click_on 'Salvar'

    expect(page).to have_content('Chinesa')
    expect(current_path).to eq(root_path)
    expect(page).to have_no_content(cuisine.name)
  end

  scenario 'and must fill in name' do
    cuisine = Cuisine.create(name: 'Europeia')

    visit root_path
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end

  scenario 'and dont allow duplicate name' do
    italian_cuisine = Cuisine.create(name: 'Italiana')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    visit root_path
    click_on italian_cuisine.name
    click_on 'Editar'
    fill_in 'Nome', with: 'Brasileira'
    click_on 'Salvar'

    expect(page).to have_content('Já existe uma cozinha cadastrada com o mesmo nome!')
    expect(page).to have_content('Editar')
  end

end
