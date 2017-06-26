
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :slaiders
  before_action :store_current_location, :unless => :devise_controller?
  def slaiders
    @share = Product.where(share: 1, visible: 1)
    @new = Product.where(new: 1, visible: 1)
  end

  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end
end
