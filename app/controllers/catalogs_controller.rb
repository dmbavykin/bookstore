class CatalogsController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'layouts/main'

  def index
    @books = Book.all
    render template: 'catalogs/index'
  end

  def show
    @books = Book.where(category_id: params[:id])
    render template: 'catalogs/index'
  end
end
