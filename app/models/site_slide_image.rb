class SiteSlideImage < ApplicationRecord

  belongs_to :site_setting
  has_attached_file :image, :styles => {:showslide => "400X", :mainslide => "800X"}, :default_url => "noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /gif\z/]

end
