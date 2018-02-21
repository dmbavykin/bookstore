class BookDecorator < ApplicationDecorator
  delegate_all
  decorates_association :author

  def class_for_slide(index)
    index.zero? ? 'item active' : 'item'
  end

  def authors
    object.author.map(&:decorate).map(&:full_name).join(', ').chomp.chop
  end
end
