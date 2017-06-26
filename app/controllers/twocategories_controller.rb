class TwocategoriesController < ApplicationController
  before_action :set_twocategory, only: [:edit, :update, :destroy]
  layout 'adminpanel', only: [:new, :edit]
  include CurrentCart
  before_action :set_cart, :cart_quantity
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_catalog

  # GET /twocategories
  # GET /twocategories.json
  def index
    @twocategories = Twocategory.all
  end

  # GET /twocategories/1
  # GET /twocategories/1.json
  def show
    @twocategory = Twocategory.friendly.find(params[:id])
    @title = @twocategory.name
    @description = @twocategory.meta_desc if @twocategory.meta_desc.present?
    @keywords = @twocategory.meta_key if @twocategory.meta_key.present?
    @categories = Category.all
    @category = @twocategory.category
    @products = Product.where(twocategory_id: @twocategory, visible: 1).order(created_at: :desc)
  end

  # GET /twocategories/new
  def new
    @twocategory = Twocategory.new
  end

  # GET /twocategories/1/edit
  def edit
  end

  # POST /twocategories
  # POST /twocategories.json
  def create
    @twocategory = Twocategory.new(twocategory_params)

    respond_to do |format|
      if @twocategory.save
        format.html { redirect_to adminpanel_twocategories_path, notice: "Подкатегория #{@twocategory.name} успешно создана" }
        format.json { render :show, status: :created, location: @twocategory }
      else
        format.html { render :new }
        format.json { render json: @twocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twocategories/1
  # PATCH/PUT /twocategories/1.json
  def update
    respond_to do |format|
      if @twocategory.update(twocategory_params)
        format.html { redirect_to adminpanel_twocategories_path, notice: "Подкатегория #{@twocategory.name} успешно создана" }
        format.json { render :show, status: :ok, location: adminpanel_twocategories_path }
      else
        format.html { render :edit }
        format.json { render json: @twocategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twocategories/1
  # DELETE /twocategories/1.json
  def destroy
    Product.where(twocategory_id: @twocategory.id).update_all(twocategory_id: :null)
    if @twocategory.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  def delete_attachment
    twocategory = Twocategory.find(params[:id])
    twocategory.image = nil
    twocategory.save
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twocategory
      @twocategory = Twocategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twocategory_params
      params.require(:twocategory).permit(:category_id, :name, :meta_desc, :meta_key, :image)
    end
end
