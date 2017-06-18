class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :slaiders

  def slaiders
    @share = Product.where(share: 1, visible: 1)
    @new = Product.where(new: 1, visible: 1)
  end
end
