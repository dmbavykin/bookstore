module ApplicationHelper
  def categories
    Category.all
  end

  def qunatity_book_in_category(id)
    Book.where(category_id: id).length
  end

  def reviews(id)
    Rating.where(book_id: id).includes(:customer)
  end
end
