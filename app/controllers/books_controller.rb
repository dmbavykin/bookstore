class BooksController < ApplicationController
  load_and_authorize_resource

  def show
    @book = @book.decorate
    @reviews = Review.where(book: @book).confirmed
    @review = Review.new if current_user
  end
end
