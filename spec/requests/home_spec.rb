require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/home/home"
      expect(response).to have_http_status(:success)
    end
  end

end
