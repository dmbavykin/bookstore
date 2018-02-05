class CatalogsController < ApplicationController

  def index
    @books = Book.readonly.all
  end

  def show
    @books = Book.readonly.where(category_id: params[:id])
    render :index
  end
end
