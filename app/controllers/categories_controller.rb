# frozen_string_literal: true

class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_filter

  def index
    @books = Book.by_filter(@filter, params[:page])
    render :show
  end

  def show
    @books = Book.where(category_id: @category).by_filter(@filter, params[:page])
  end

  private

  def set_filter
    @filter = Book::FILTERS.include?(params[:filter]&.to_sym) ? params[:filter] : Book::DEFAULT_FILTER
  end
end
