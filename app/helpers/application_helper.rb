module ApplicationHelper
  def categories
    Category.all
  end

  def qunatity_book_in_category(id)
    Book.where(category_id: id).count
  end

  def book_in_cart
    @order.order_items.count
  end
end
