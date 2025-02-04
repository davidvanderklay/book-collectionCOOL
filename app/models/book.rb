class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :user_books

  validates :title, presence: { message: 'must be provided' }
  validates :author, presence: { message: 'must be provided' }
  validates :price, presence: { message: 'must be provided' }, numericality: { greater_than_or_equal_to: 0 }
  validates :published_date, presence: { message: 'must be provided' }
end
