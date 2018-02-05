class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    render template: 'books/show'
  end
end
