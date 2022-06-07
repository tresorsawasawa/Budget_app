require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'tresor@test.com', password: 'password')
  end

  it 'is valid with valid attributes' do
    expect(@tresor).to be_valid
  end

  it 'is not valid without an email' do
    @tresor.email = nil
    expect(@tresor).to_not be_valid
  end

  it 'is not valid without an password' do
    @tresor.password = ''
    expect(@tresor).to_not be_valid
  end

  it 'is not valid without a name' do
    @tresor.name = nil
    expect(@tresor).to_not be_valid
  end

  it 'is not valid without if name length is more than 50 characters' do
    @tresor.name = 'a' * 51
    expect(@tresor).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:categories) }
    it { should have_many(:exchanges).with_foreign_key('author_id') }
  end
end
