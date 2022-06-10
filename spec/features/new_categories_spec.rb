require 'rails_helper'

RSpec.describe 'new category page', type: :feature do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'test@email.com',
                          password: 'password', created_at: Time.now, updated_at: Time.now)
    @tresor.confirm
  end

  after(:each) do
    User.destroy_all
  end

  it 'should not access this page if user is not connected.' do
    visit new_category_path
    expect(page).to_not have_content '⇽'
    expect(page).to_not have_content 'New Transaction'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  it 'should access this page if user is connected' do
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content 'CATEGORIES'

    visit new_category_path

    expect(page).to have_content '⇽'
    expect(page).to have_content 'Create New Category'
    expect(page).to_not have_content 'LOG IN'
  end
end
