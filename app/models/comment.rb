class Comment < ApplicationRecord
  belongs_to :product
  validates :body, :presence => {message: 'Поле кооментарий не может быть пустым'}
end
