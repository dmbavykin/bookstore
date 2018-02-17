class CategoriesController < ApplicationController
  def index
    @filter = params[:filter] || :newest
    @books = Book.public_send(@filter).page(params[:page])
  end

  def show
    @filter = params[:filter] || :newest
    @category = Category.find(params[:id])
    @books = Book.where(category_id: @category).public_send(@filter).page(params[:page])
  end
end
