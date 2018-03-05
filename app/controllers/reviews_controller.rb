class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.create(review_params)
    @review.errors.any? ? flash[:alert] = t('review.failure.create') : flash[:notice] = t('review.successful.create')
    redirect_to book_path(review_params[:book_id])
  end

  private

  def review_params
    params.require(:review).permit(:name, :comment_text, :rating, :book_id, :avatar)
  end
end
