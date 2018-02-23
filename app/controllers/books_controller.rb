class BooksController < ApplicationController
  before_action :set_reviews, only: :show
  load_and_authorize_resource

  private

  def set_reviews
    @reviews = Review.where(book: params[:id]).confirmed
    @review = Review.new if current_user
  end
end
