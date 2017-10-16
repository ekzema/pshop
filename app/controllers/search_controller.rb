class SearchController < ApplicationController
  include CurrentCart
  before_action :set_cart, :cart_quantity



  def result
    @categories = Category.all
    if params[:q].blank?
      redirect_back(fallback_location: root_path, notice: 'Введите текст для поиска!')
    else
      @products = Product.order(:name).where("name LIKE ?", "%#{params[:q]}%").rewhere(visible: 1).paginate(:page => params[:page], :per_page => 12)
    end
  end

  def autocomplete
    @products = Product.order(:name).where("name LIKE ?", "%#{params[:term]}%").rewhere(visible: 1).limit(10)
    render json: @products.map{|i| i.name}
  end

end
