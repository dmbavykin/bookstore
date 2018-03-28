# frozen_string_literal: true

class BooksController < ApplicationController
  load_and_authorize_resource

  def show
    @book = @book.decorate
    @reviews = @book.reviews.confirmed
  end
end
