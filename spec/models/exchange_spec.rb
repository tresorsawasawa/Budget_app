require 'rails_helper'

RSpec.describe Exchange, type: :model do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'tresor@test.com', password: 'password')
    expect(@tresor).to be_valid
    @exchange = Exchange.create(name: 'Clothes', amount: 'C', author_id: @tresor.id)
  end

  after(:each) do
    User.destroy_all
    Exchange.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@exchange).to be_valid
  end

  it 'is not valid without a name' do
    @exchange.name = nil
    expect(@exchange).to_not be_valid
  end

  it 'is not valid without an amount' do
    @exchange.amount = nil
    expect(@exchange).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_many(:categories).through(:slots) }
  end
end
