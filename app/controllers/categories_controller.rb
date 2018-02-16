class CategoriesController < ApplicationController
  def index
    @books = Book.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @books = Book.where(category_id: @category).page(params[:page])
  end
end
