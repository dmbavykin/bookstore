class CategoriesController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @category = Category.find(params[:id])
    @books = Book.where(category_id: @category)
  end
end
