class CatalogsController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render template: 'catalogs/index', layout: 'main'
  end

  def show

  end
end
