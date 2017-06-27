class SiteSlideImagesController < ApplicationController
  before_action :authenticate_rootadmin!
  def create
    site_setting = SiteSetting.find(params[:site_setting_id])
    site_slide_image = site_setting.site_slide_images.create(site_slide_image_params)
  end

  private
  def site_slide_image_params
    params.require(:site_slide_image).permit([:image])
  end
end
