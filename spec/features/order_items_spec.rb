# frozen_string_literal: true

feature 'cart page' do
  let!(:book) { create(:book, quantity: 2) }
  let!(:user) { create(:user) }
  let!(:order) { create(:order, user: user, state: 'filling') }

  background do
    create(:order_item, order: order)
    create(:order_item, order: order, book: book)
    sign_in(user, order_items_path)
  end

  scenario 'check main elements' do
    expect(page).to have_selector('.hidden-xs .general-img-wrap-table', count: order.order_items.count)
    expect(page).to have_selector('.hidden-xs .close.general-cart-close', count: order.order_items.count)
    order.order_items.each do |item|
      expect(page).to have_css('.hidden-xs span.font-16.in-gold-500', text: "€#{item.book.price}")
    end
    expect(page).to have_css('.btn', text: 'Checkout')
  end
end
