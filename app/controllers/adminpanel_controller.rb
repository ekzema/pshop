class AdminpanelController < ApplicationController
  layout 'adminpanel'

  def index
    @product = Product.count
    @category = Category.count
    @twocategory = Twocategory.count
  end

  def categories
    @category = Category.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end

  def twocategories
    @twocategory = Twocategory.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end

  def products
    @product = Product.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end

end
