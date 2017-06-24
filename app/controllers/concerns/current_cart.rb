module CurrentCart
  extend ActiveSupport::Concern

  def cart_quantity
    @cart_quantity = @cart.line_items.to_a.sum { |item| item.quantity.to_i }
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end