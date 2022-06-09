require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:each) do
    @tresor = User.create(name: 'Tresor', email: 'tresor@test.com', password: 'password')
    @tresor.confirm
    sign_in @tresor
    get categories_url
  end

  describe 'GET /index' do
    it 'gets the index page' do
      expect(response).to have_http_status :ok
    end

    it 'renders the index page' do
      expect(response).to render_template(:index)
    end

    it 'should have some html' do
      expect(response.body).to include '<section class="categories-section">'
    end
  end

  describe ' GET /categories/new' do
    before(:example) { get new_category_path }
    it 'should redirect to add category page' do
      expect(response).to have_http_status :ok
    end

    it 'should render category page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include '<h2 class="category_form_heading">New Category</h2>'
    end
  end

  describe 'should create category' do
    before(:each) do
      @category = Category.create(name: 'Clothes', icon: 'C', user_id: @tresor.id)
    end
    it 'should create new category' do
      expect(@category).to be_valid
    end

    it 'should be of the person of id' do
      expect(@tresor.categories.count).to be 1
      @category.destroy
      expect(@tresor.categories.count).to be 0
    end
  end

  describe 'should not beacuse invali entry' do
    before(:each) do
      @category = Category.create(name: 'Clothes', user_id: @tresor.id)
    end
    it 'should be invalid' do
      expect(@category).not_to be_valid
    end
  end

  describe 'GET /edit' do
    before(:each) do
      @category = Category.create(name: 'Clothes', icon: 'C', user_id: @tresor.id)
    end

    it 'renders a successful response' do
      get edit_category_url(@category)
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested category' do
      @category = Category.create(name: 'Clothes', icon: 'C', user_id: @tresor.id)
      expect do
        delete category_url(@category)
      end.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      @category = Category.create(name: 'Clothes', icon: 'C', user_id: @tresor.id)
      delete category_url(@category)
      expect(response).to redirect_to(categories_url)
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Clothes', icon: 'C' }
      end

      it 'redirects to the category' do
        @category = Category.create(name: 'Clothes',  icon: 'C', user_id: @tresor.id)
        patch category_url(@category), params: { category: new_attributes }
        @category.reload
        expect(response).to redirect_to(category_url(@category))
      end
    end
  end
end
