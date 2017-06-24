class LineItemsController < ApplicationController

  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy, :update]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_product(@product.id)
    cart_quantity
    respond_to do |format|
      if @line_item.save
        # format.html { redirect_to @line_item.cart }
        format.js
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    if params[:line_item][:quantity] < "1"
      render js: "alert('Колличество товара должно быть не меньше 1-ого!');"
    else
      respond_to do |format|
        @line_item.update(line_item_params)
        cart_quantity
        format.js
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|

      format.js
    end
  end

  def cart_quantity
    @cart_quantity = @cart.line_items.to_a.sum { |item| item.quantity.to_i }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
