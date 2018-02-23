class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    @review.errors.any? ? flash[:alert] = t('review.failure.create') : flash[:notice] = t('review.successful.create')
    redirect_to book_path(review_params[:book_id])
  end

  private
  def review_params
    params.require(:review).permit(:name, :comment_text, :rating, :book_id, :user_id, :avatar)
  end
end
