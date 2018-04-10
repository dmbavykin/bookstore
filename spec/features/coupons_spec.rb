# frozen_string_literal: true

feature 'cart coupons' do
  let!(:book) { create(:book) }
  let!(:user) { create(:user) }
  let!(:order) { create(:order, user: user, state: 'filling') }
  let!(:order_item) { create(:order_item, order: order) }
  let!(:coupon) { create(:coupon, :without_order) }

  background { sign_in(user, order_items_path) }

  scenario 'adding coupon successful' do
    fill_in('coupon_code', with: coupon.code)
    click_button('coupon-code-btn')
    expect(page).to have_css('.alert-success', text: I18n.t('coupon.added'))
    expect(page).to have_content("€#{coupon.sale}")
  end

  scenario 'removing coupon successful' do
    coupon.update(order: order)
    visit order_items_path
    click_link('coupon-code-btn')
    expect(page).to have_css('.alert-success', text: I18n.t('coupon.removed'))
    expect(page).to have_content('€0.0')
  end
end
