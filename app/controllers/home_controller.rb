class HomeController < ApplicationController
  def index
    @slider_items = Book.last(3)
  end
end
