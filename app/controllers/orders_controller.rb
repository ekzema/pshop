class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  layout 'adminpanel', only: [:edit, :update]
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
   def new
    if @cart.line_items.count == 0
      redirect_to :root, :notice => 'Для оформления заказа добавьте товар в корзину!'
    else
      @order = Order.new
    end
  end

  # GET /orders/1/edit
  def edit
    @line_item = LineItem.where(order_id: @order)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to :root, notice:
            'Спасибо за Ваш заказ!' }
        format.json { render action: 'show', status: :created,
                             location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.json { render json: :ok }
      end
    end
  end

  def form_render
    if params[:order][:city]
      if params[:order][:city].blank?
        render text: ''
      else
        @city = params[:order][:city]
        render :partial => 'city', locals: {state: @city}
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    if @order.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def invalid_order
    redirect_to :root, :notice => 'Эта страница не существет или была удалена!'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type, :phone, :city, :delivery, :note, :moderation)
  end
end
