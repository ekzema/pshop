class SiteSetting < ApplicationRecord
	has_many :site_slide_images, :dependent => :destroy
	before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :image, :default_url => "NoImage_180X170.jpg"
  accepts_nested_attributes_for :site_slide_images,
                                :allow_destroy => true,
                                :reject_if => :all_blank
end
