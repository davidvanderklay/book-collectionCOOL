class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = 'Book added successfully!'
      redirect_to root_path
    else
      # Handle validation
      flash.now[:alert] = 'Error creating book. Please check the form.'
      render :new
    end
  end

  # app/controllers/books_controller.rb
  def show
    puts "Params ID: #{params[:id]}" # Debugging line
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id]) # Find the book by ID
    if @book.update(book_params)
      flash[:notice] = 'Book updated successfully!'
      redirect_to book_path(@book) # Redirect to the show page after successful update
    else
      render :edit # Re-render the edit form if there are errors
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book deleted successfully!'
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end
end
