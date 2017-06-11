class Category < ApplicationRecord

  has_many :twocategories, :dependent => :destroy
  has_many :products, :dependent => :destroy
  validates :name, :presence => {message: 'Введите название категории'}
  validates :name, :uniqueness => {message: 'Категория с таким именем уже существует'}
  has_attached_file :image, :default_url => "noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /gif\z/]

end
