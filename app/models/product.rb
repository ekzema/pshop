class Product < ApplicationRecord
  has_many :line_items
  belongs_to :twocategory
  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :image, :styles => { :medium => "200x300>", :thumb => "180", :cart_icon => "X50" }, :default_url => "NoImage_180X170.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
