require 'rails_helper'

RSpec.describe 'categories/index', type: :feature do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'test@email.com',
                          password: 'password', created_at: Time.now, updated_at: Time.now)
    @tresor.confirm

    @cat1 = Category.create(name: 'Category_1', icon: 'https://cdn-icons-png.flaticon.com/512/6969/6969002.png',
                            user: @tresor)
    Category.create(name: 'Category_2', icon: 'https://cdn-icons-png.flaticon.com/512/6969/6969002.png', user: @tresor)

    @ex1 = Exchange.create(name: 'transaction 1', amount: '20', author: @tresor)
    @ex1.categories << @cat1
    @ex2 = Exchange.create(name: 'transaction 2', amount: '19', author: @tresor)
    @ex2.categories << @cat1

    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  after(:each) do
    User.destroy_all
  end

  it 'I can access this page if user is connected' do
    visit categories_path

    expect(page).to_not have_content 'SawaTransfer'
    expect(page).to have_content 'CATEGORIES'
  end

  it 'I can logout form the catagories page' do
    visit categories_path

    expect(page).to_not have_content 'SawaTransfer'
    expect(page).to have_content 'CATEGORIES'

    click_button 'Sign out'

    expect(page).to have_content 'SawaTransfer'
    expect(page).to_not have_content 'CATEGORIES'
  end
end
