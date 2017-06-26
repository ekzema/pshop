class Feed < ApplicationRecord
  validates :name, :presence => {message: 'Введите ваше имя'}
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "doesn't look like an email address"
  validates :phone, :presence => {message: 'Введите свой номер телефона'}
  validates :description, :presence => {message: 'Оставьте пожалуйста свой отзыв'}
end
