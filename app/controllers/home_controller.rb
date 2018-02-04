class HomeController < ApplicationController
  layout 'layouts/main'

  def index
    render template: 'home/home'
  end
end
