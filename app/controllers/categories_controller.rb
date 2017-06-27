class CategoriesController < ApplicationController
  before_action :authenticate_rootadmin!, except: [:show]
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :cart_quantity, only: [:show, :edit, :update, :destroy]
  layout 'adminpanel', only: [:new, :edit]
  include CurrentCart
  before_action :set_cart, :cart_quantity
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_catalog

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.friendly.find(params[:id])
    @title = @category.name
    @description = @category.meta_desc if @category.meta_desc.present?
    @keywords = @category.meta_key if @category.meta_key.present?
    @categories = Category.all
    @products = Product.where(category_id: @category, visible: 1).order(created_at: :desc)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to adminpanel_categories_path, notice: "Категория #{@category.name} успешно создана"  }
        format.json { render :show, status: :created, location: adminpanel_categories_path }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to adminpanel_categories_path, notice: "Категория #{@category.name} успешно обновлена" }
        format.json { render :show, status: :ok, location: adminpanel_categories_path }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    Product.where(category_id: @category.id).update_all(category_id: :null, twocategory_id: :null)
    if @category.destroy
      respond_to do |format|
        format.js
    end
    end
  end

  def delete_attachment
    category = Category.find(params[:id])
    category.image = nil
    category.save
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :meta_desc, :meta_key, :image)
    end
end
