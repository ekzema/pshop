class Comment < ApplicationRecord
  belongs_to :product
  validates :body, :presence => {message: 'Поле комментарий не может быть пустым'}
end
