class BookDecorator < ApplicationDecorator
  delegate_all
  decorates_association :author

  def class_for_slide(index)
    index.zero? ? 'item active' : 'item'
  end
end
