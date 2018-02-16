class HomeController < ApplicationController
  def index
    @slider_items = Book.for_slider.map(&:decorate)
  end
end
