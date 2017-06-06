class WelcomeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_catalog
  def index
    @products = Product.all
    @categories = Category.all
  end
end
