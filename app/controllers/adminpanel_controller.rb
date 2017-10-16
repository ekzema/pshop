class AdminpanelController < ApplicationController
  before_action :authenticate_rootadmin!
  skip_before_action :slaiders, :main_setting_site
  layout 'adminpanel'

  def index
    @product = Product.count
    @category = Category.count
    @twocategory = Twocategory.count
    @order = Order.count
    @feed = Feed.count
    @comment = Comment.count
  end

  def settings
    @site_setting = SiteSetting.first
    @site_setting.site_slide_images.build
  end

  def categories
    @category = Category.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end

  def twocategories
    @twocategory = Twocategory.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
  end

  def products
    @product = Product.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    @category = Proc.new { |id| Category.find(id) }
    @categories = Category.all
    @twocategory = Proc.new { |id| Twocategory.find(id) }
    @sort = params[:sort]
    @cat = Category.find(params[:sort]) if params[:column] == 'category_id'
    if @sort == 'all' || @sort == 'all_cat'
      @product
    elsif @sort
      @product = Product.where(params[:column] => params[:sort]).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
      @sort = params[:column] + params[:sort]
    end
    if params[:q]
      if params[:q] == ''
        @product = Product.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
        unless params[:page].present?
          respond_to do |format|
            format.js
          end
        end
      else
        @product = Product.where("name LIKE ?", "%#{params[:q]}%").paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
        unless params[:page].present?
          respond_to do |format|
            format.js
          end
        end
      end
    end
  end

  def orders
    @orders = Order.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    @sort = params[:moderation]
    if @sort == 'all'
      @orders
    elsif @sort
      @orders = Order.where(moderation: params[:moderation]).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    end
  end


  def feedback
    @feed = Feed.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    @sort = params[:moderation]
    if @sort == 'all'
      @feed
    elsif @sort
      @feed = Feed.where(moderation: params[:moderation]).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    end
  end

  def comments
    @comment = Comment.paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    @sort = params[:moderation]
    if @sort == 'all'
      @comment
    elsif @sort
      @comment = Comment.where(moderation: params[:moderation]).paginate(:page => params[:page], :per_page => 20).order(created_at: :desc)
    end
  end

end
