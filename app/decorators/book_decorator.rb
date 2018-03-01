class BookDecorator < ApplicationDecorator
  delegate_all
  decorates_association :author

  def class_for_slide(index)
    index.zero? ? 'item active' : 'item'
  end

  def class_for_slide_btn
    quantity.zero? ? "disabled btn" : 'btn btn-primary'
  end

  def authors
    author.map(&:full_name).join(', ')
  end

  def dimensions
    ["H: #{height} \"", "W: #{width}\"",  "D: #{depth}\""].join(" x ")
  end
end
