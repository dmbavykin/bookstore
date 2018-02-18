class CategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @filter = params[:filter] || :newest
    @books = Book.public_send(@filter).page(params[:page])
  end

  def show
    @filter = params[:filter] || :newest
    @books = Book.where(category_id: @category).public_send(@filter).page(params[:page])
  end
end
