class WelcomeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_catalog
  def index
    @products = Product.where(visible: 1).order(created_at: :desc)
    @categories = Category.all
  end

  def contacts
	@feed = Feed.new
  end

  def new
    @products = Product.where(visible: 1).order(created_at: :desc)
    @categories = Category.all
  end

  def about

  end

  def sale
    @products = Product.where(visible: 1).order(created_at: :desc)
    @categories = Category.all
  end

  def payment

  end

  def back

  end


end
