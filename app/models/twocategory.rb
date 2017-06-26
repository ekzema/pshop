class Twocategory < ApplicationRecord
  belongs_to :category
  validates :name, :presence => {message: 'Введите название подкатегории'}
  validates :name, :uniqueness => {message: 'Подкатегория с таким именем уже существует'}
  has_attached_file :image, :default_url => "noimage.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /gif\z/]

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
