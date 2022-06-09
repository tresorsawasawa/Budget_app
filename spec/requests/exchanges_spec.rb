require 'rails_helper'

RSpec.describe 'Exchanges', type: :request do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'tresor@test.com', password: 'password')
    @tresor.confirm
    sign_in @tresor

    @cat1 = Category.create(name: 'Category_1', icon: 'icon_1', user_id: @tresor.id)
    @ex1 = Exchange.create(name: 'C&A', amount: 29.99, author_id: @tresor.id)
  end
  
  describe 'GET /index' do
    it 'renders a successful response' do
      @cat1.exchanges << @ex1
      get category_exchanges_path @cat1
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_exchange_path @cat1
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        { name: 'C&A', amount: 29.99, author_id: @tresor.id }
      end

      it 'redirects to the created exchange' do
        post category_exchanges_path @cat1, params: { exchange: valid_attributes }
        expect(response).to redirect_to(category_exchanges_path(@cat1))
      end
    end
  end
end
