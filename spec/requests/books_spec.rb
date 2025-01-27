# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Book and redirects to home page' do
        expect do
          post books_path, params: { book: { title: 'Fortnite battle pass' } }
        end.to change(Book, :count).by(1)

        expect(response).to redirect_to(root_path)
        follow_redirect!
        # Then check for the flash notice
        expect(response.body).to include('Book added successfully!')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book and rerenders the new template' do
        expect do
          post books_path, params: { book: { title: '' } } # Invalid: empty title
        end.to change(Book, :count).by(0)

        expect(response).to render_template(:new)
        expect(response.body).to include('Title must be provided') # Check for validation error message
      end
    end
  end
end
