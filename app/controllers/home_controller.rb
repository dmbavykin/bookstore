class HomeController < ApplicationController
  def index
    render template: 'home/home'
  end
end
