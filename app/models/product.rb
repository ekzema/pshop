class Product < ApplicationRecord
  has_many :line_items, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :product_slide_images, :dependent => :destroy
  validates :name, :presence => {message: 'Введите название товара'}
  validates :name, :uniqueness => {message: 'Товар с таким именем уже существует'}
  validates :category_id, :presence => {message: 'Выберите категорию'}
  validates :price, :presence => {message: 'Укажите цену товара'}
  validates :price, numericality: true
  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :image, :styles => {:admin => "X100", :thumb => "X60", :showproduct => "450X"}, :default_url => "NoImage_180X170.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  accepts_nested_attributes_for :product_slide_images,
                                :allow_destroy => true,
                                :reject_if => :all_blank

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

# def to_param
#   "#{id}-#{name.parameterize}"
# end

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
