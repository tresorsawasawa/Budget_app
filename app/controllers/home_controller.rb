class HomeController < ApplicationController
  def home
    redirect_to categories_path if user_signed_in?
  end
end
