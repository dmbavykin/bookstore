class CategoriesController < ApplicationController
  load_resource
  before_action :set_filter
  def index
    @books = Book.public_send(@filter).page(params[:page])
  end

  def show
    @books = Book.where(category_id: @category).public_send(@filter).page(params[:page])
  end

  private

  def set_filter
    @filter = Book::FILTERS.key?(params[:filter_id]) ? params[:filter] : Book::DEFAULT_FILTER
  end
end
