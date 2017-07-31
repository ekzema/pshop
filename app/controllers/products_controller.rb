class ProductsController < ApplicationController
  before_action :authenticate_rootadmin!, except: [:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  layout 'adminpanel', only: [:new, :edit, :update, :create]
  skip_before_action :verify_authenticity_token, only: [:update]
  include CurrentCart
  before_action :set_cart, only: [:show]
  before_action :cart_quantity, only: [:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.friendly.find(params[:id])
    @title = @product.name
    @description = @product.meta_desc
    @keywords = @product.meta_key
    @pr_cat = Category.find(@product.category_id)
    @comments = @product.comments.where(moderation: 1).order(created_at: :desc)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @category = @product.category_id
    @twocategories = Twocategory.where(category_id: @product.category_id)
  end

  # POST /products
  # POST /products.json
  def create
    @twocategories = Twocategory.all
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        @product.product_slide_images.build
        return redirect_to edit_product_path(@product.id) if params[:back]
        format.html { redirect_to adminpanel_products_path, notice: 'Товар успешно добавлен' }
        format.json { render :show, status: :ok, location: adminpanel_products_path }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        @product.product_slide_images.build
        return redirect_to edit_product_path(@product.id) if params[:back]
        format.html { redirect_to adminpanel_products_path, notice: 'Товар успешно обновлён' }
        format.json { render :show, status: :ok, location: adminpanel_products_path }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def form_render
    @twocategory = Twocategory.where(category_id: params[:product][:category_id])
    if params[:product][:category_id]
      if params[:product][:category_id].blank?
        render text: ''
      else
        render :partial => 'twocategory', locals: {twocategory: @twocategory}
      end
    end

  end

  def sort_top
    if params[:product_id]
      @pr = Product.find(params[:product_id])
      @pr.update(:sort_top => params[:sort_top])
      head :ok
    else
      head :error
    end

  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if @product.destroy
      respond_to do |format|
        format.js
      end
    end
  end


  def delete_attachment
    product = Product.find(params[:id])
    product.image = nil
    product.save
    redirect_back(fallback_location: root_path)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:twocategory_id, :category_id, :name, :description, :price, :visible, :meta_desc, :meta_key, :new, :share, :share_price, :image, :sort_top, product_slide_images_attributes: [:id, :_destroy, :image])
    end
end
