class SiteSetting < ApplicationRecord

  has_many :site_slide_images, :dependent => :destroy
  accepts_nested_attributes_for :site_slide_images,
                                :allow_destroy => true,
                                :reject_if => :all_blank
end
