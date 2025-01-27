require 'rails_helper'

RSpec.describe Book, type: :model do
  # validate stuff
  describe 'validations' do
    it 'is valid with title' do
      book = Book.new(title: 'Dragon Deez')
      expect(book).to be_valid
    end

    it 'is not valid with title' do
      book = Book.new(title: nil)
      expect(book).to_not be_valid
    end
  end
end
