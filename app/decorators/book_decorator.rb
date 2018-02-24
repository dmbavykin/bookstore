class BookDecorator < ApplicationDecorator
  delegate_all
  decorates_association :author

  def class_for_slide(index)
    index.zero? ? 'item active' : 'item'
  end

  def authors
    author.map(&:full_name).join(', ')
  end

  def dimensions
    ["H: #{height} \"", "W: #{width}\"",  "D: #{depth}\""].join(" x ")
  end
end
