class WelcomeController < ApplicationController
  include CurrentCart
  before_action :set_cart, :cart_quantity

  def index
    @products = Product.where(visible: 1).order(created_at: :desc)
    @categories = Category.all
  end

  def contacts
	@feed = Feed.new
  end

  def new
    @products = Product.where(visible: 1, new: 1).order(created_at: :desc).paginate(:page => params[:page], :per_page => 12).order(created_at: :desc)
    @categories = Category.all
  end

  def about

  end

  def sale
    @products = Product.where(visible: 1, share: 1).order(created_at: :desc).paginate(:page => params[:page], :per_page => 12).order(created_at: :desc)
    @categories = Category.all
  end

  def payment

  end

  def back

  end


end
