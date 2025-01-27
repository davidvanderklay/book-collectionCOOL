require 'rails_helper'

RSpec.describe Book, type: :model do
  # validate stuff
  describe 'validations' do
    it 'is valid with title' do
      book = Book.new(title: 'Dragon Deez', author: 'ur mom wooyeah', price: 12.99,
                      published_date: Date.new(1954, 7, 29))
      expect(book).to be_valid
    end

    it 'is not valid without title' do
      book = Book.new(author: 'ur mom wooyeah', price: 12.99, published_date: Date.new(1954, 7, 29))
      expect(book).to_not be_valid
      expect(book.errors[:title]).to include('must be provided')
    end

    # Author Validation
    it 'is not valid without an author' do
      book = Book.new(title: 'Dragon Deez', price: 12.99, published_date: Date.new(1954, 7, 29))
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include('must be provided') # Check for specific error message
    end

    # Price Validation
    it 'is not valid without a price' do
      book = Book.new(title: 'Dragon Deez', author: 'ur mom wooyeah', published_date: Date.new(1954, 7, 29))
      expect(book).not_to be_valid
      expect(book.errors[:price]).to include('must be provided') # Check for specific error message
    end

    # Published Date Validation
    it 'is not valid without a published date' do
      book = Book.new(title: 'Dragon Deez', author: 'ur mom wooyeah', price: 12.99)
      expect(book).not_to be_valid
      expect(book.errors[:published_date]).to include('must be provided') # Check for specific error message
    end
  end
end
