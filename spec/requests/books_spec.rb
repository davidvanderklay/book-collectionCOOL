# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'POST /create' do
    # Valid params
    context 'with valid parameters' do
      it 'creates a new Book and redirects to home page' do
        expect do
          post books_path, params: { book: {
            title: 'Dragon Deez',
            author: 'ur mom wooyeah',
            price: 12.99,
            published_date: Date.new(1979, 10, 12)
          } }
        end.to change(Book, :count).by(1)

        expect(response).to redirect_to(root_path)
        follow_redirect!
        # Then check for the flash notice
        expect(response.body).to include('Book added successfully!')
      end
    end

    # Invalid params
    context 'with invalid parameters' do
      it 'does not create a new Book and rerenders the new template (title be missing)' do
        expect do
          post books_path, params: { book: {
            author: 'ur mom wooyeah',
            price: 12.99,
            published_date: Date.new(1979, 10, 12)
          } }
        end.to change(Book, :count).by(0)
        expect(response).to render_template(:new)
        expect(response.body).to include('Title must be provided') # Check for validation error message
      end

      it 'does not create new book when author missing' do
        expect do
          post books_path, params: { book: {
            title: 'Dragon Deez',
            price: 12.99,
            published_date: Date.new(1979, 10, 12)
          } }
        end.to change(Book, :count).by(0)

        expect(response).to render_template(:new)
        expect(response.body).to include('Author must be provided')
      end

      it 'does not create book if price missing' do
        expect do
          post books_path, params: { book: {
            title: 'Dragon Deez',
            author: 'ur mom wooyeah',
            published_date: Date.new(1979, 10, 12)
          } }
        end.to change(Book, :count).by(0)

        expect(response).to render_template(:new)
        expect(response.body).to include('Price must be provided')
      end

      it 'does not create book if published_date missing' do
        expect do
          post books_path, params: { book: {
            title: 'Dragon Deez',
            author: 'ur mom wooyeah',
            price: 12.99
          } }
        end.to change(Book, :count).by(0)

        expect(response).to render_template(:new)
        expect(response.body).to include('Price must be provided')
      end
    end
  end
end
