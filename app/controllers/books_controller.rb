class BooksController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'layouts/main'

  def show
    @book = Book.find(params[:id])
    render template: 'books/show'
  end
end
