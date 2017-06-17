class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable , :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable

  has_attached_file :avatar, :styles => { :medium => "x100", :mini => "x50" }, :default_url => "no_foto.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/, /gif\z/]
end
