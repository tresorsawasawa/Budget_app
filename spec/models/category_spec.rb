require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'tresor@test.com', password: 'password')
    expect(@tresor).to be_valid
    @clothes_category = Category.create(name: 'Clothes', icon: 'C', user_id: @tresor.id)
  end

  after(:each) do
    User.destroy_all
    Category.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@clothes_category).to be_valid
  end

  it 'is not valid without a name' do
    @clothes_category.name = nil
    expect(@clothes_category).to_not be_valid
  end

  it 'is not valid without an icon' do
    @clothes_category.icon = nil
    expect(@clothes_category).to_not be_valid
  end

  it 'is not valid if name length is more than 30 characters' do
    @clothes_category.name = 'a' * 40
    expect(@clothes_category).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:exchanges).through(:slots) }
  end
end
