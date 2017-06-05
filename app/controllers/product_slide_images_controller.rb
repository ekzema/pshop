class ProductSlideImagesController < ApplicationController
  def create
    prosuct = Post.find(params[:prosuct_id])
    prosuct_slide_image = prosuct.prosuct_slide_images.create(product_slide_image_params)
  end

  private
  def product_slide_image_params
    params.require(:prosuct_slide_image).permit([:image])
  end
end
