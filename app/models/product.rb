class Product < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :product_slide_images, :dependent => :destroy

  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :image, :styles => {:admin => "X100", :thumb => "X60", :showproduct => "250X" }, :default_url => "NoImage_180X170.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  accepts_nested_attributes_for :product_slide_images,
                                :allow_destroy => true,
                                :reject_if => :all_blank

      private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
