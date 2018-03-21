class ReviewsController < ApplicationController
  load_and_authorize_resource :book

  def create
    @review = current_user.reviews.create(review_params.merge(book: @book))
    @review.errors.any? ? flash[:alert] = t('review.failure.create') : flash[:notice] = t('review.successful.create')
    redirect_to @book
  end

  private

  def review_params
    params.require(:review).permit(:name, :comment_text, :rating, :book_id, :avatar)
  end
end
