class CatalogsController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @books = Book.where(category_id: params[:id])
    render :index
  end
end
