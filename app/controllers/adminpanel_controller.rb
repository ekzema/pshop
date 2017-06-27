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
    @category = Proc.new{|id| Category.find(id)}
    @twocategory = Proc.new{|id| Twocategory.find(id)}
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
