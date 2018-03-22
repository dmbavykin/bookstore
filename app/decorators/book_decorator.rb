class BookDecorator < ApplicationDecorator
  delegate_all

  def class_for_slide(index)
    index.zero? ? 'item active' : 'item'
  end

  def class_for_slide_btn
    quantity.zero? ? 'disabled btn' : 'btn btn-primary'
  end

  def authors_names
    authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def dimensions
    ["H: #{height} \"", "W: #{width}\"", "D: #{depth}\""].join(' x ')
  end

  def main_image
    images.any? ? images.first.path : 'default'
  end

  def wrapper_class(disabled)
    'thumbnail general-thumbnail' << (disabled ? ' disabled' : '')
  end

  def reviews_count
    "Reviews (#{reviews ? reviews.confirmed.count : 0})"
  end
end
