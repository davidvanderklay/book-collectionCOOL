class Book < ApplicationRecord
  validates :title, presence: { message: 'must be provided' }
end
