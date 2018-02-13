class CatalogsController < ApplicationController
  def index
    @books = Book.readonly.all
  end

  def show
    @books = Book.readonly.where(category_id: params[:id])
    @reviews = Rating.where(book_id: params[:id]).includes(:customer)
    render :index
  end
end
