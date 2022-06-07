require 'rails_helper'

RSpec.describe Slot, type: :model do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'tresor@test.com', password: 'password')
    expect(@tresor).to be_valid
    @clothes_category = Category.create(name: 'Clothes', icon: 'C', user_id: @tresor.id)
    @exchange = Exchange.create(name: 'Clothes', amount: 'C', author_id: @tresor.id)
    @slot = Slot.create(category_id: @clothes_category.id, exchange_id: @exchange.id)
  end

  after(:each) do
    User.destroy_all
    Slot.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@slot).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:category) }
    it { should belong_to(:exchange) }
  end
end
