feature 'checkout page' do
  let!(:book) { create(:book, quantity: 2) }
  let!(:user) { create(:user) }
  let!(:order) { create(:order, user: user, state: 'filling') }
  let!(:delivery) { create(:delivery) }
  let!(:credit_card) { create(:credit_card, user: user) }

  background do
    create(:order_item, order: order)
    create(:order_item, order: order, book: book)
    sign_in(user, order_steps_path)
  end

  context 'addresses' do
    scenario 'check main elements on addresses page' do
      expect(page).to have_css('.general-title-margin', text: 'Checkout')
      expect(page).to have_css('.checkbox-text', text: 'Use Billing Adress')
      expect(page).to have_selector('#addresses-submit-btn')
      expect(page).to have_selector('#addresses_form')
    end

    scenario 'filling addresses' do
      fill_address(:billing, build(:address))
      fill_address(:shipping, build(:address))
      click_button('addresses-submit-btn')
      expect(page).to have_css('.general-subtitle', text: 'Delivery')
    end
  end

  context 'delivery' do
    background do
      order.addresses.billing.create(attributes_for(:address).stringify_keys)
      order.addresses.shipping.create(attributes_for(:address).stringify_keys)
      visit order_step_path(:delivery)
    end

    scenario 'check main elements on delivery page' do
      expect(page).to have_css('.general-subtitle', text: 'Delivery')
      expect(page).to have_css('.radio-text', text: delivery.title)
      expect(page).to have_css('span', text: delivery.days)
      expect(page).to have_css('span', text: delivery.price)
      expect(page).to have_css('#deliveries-submit-btn')
    end

    scenario 'choosing delivery method' do
      first('.hidden-xs .radio-label').click
      click_button('deliveries-submit-btn')
      expect(page).to have_css('.general-subtitle', text: 'Credit Card')
    end
  end

  context 'payment' do
    background do
      order.addresses.billing.create(attributes_for(:address).stringify_keys)
      order.addresses.shipping.create(attributes_for(:address).stringify_keys)
      order.update(delivery: delivery)
      visit order_step_path(:payment)
    end

    scenario 'check main elements on payment page' do
      expect(page).to have_css('.general-subtitle', text: 'Credit Card')
      expect(page).to have_selector('input.form-control', count: 4)
      expect(page).to have_css('#payment-submit-btn')
    end

    scenario 'filling payment' do
      fill_card(attributes_for(:credit_card))
      click_button('payment-submit-btn')
      ['Billing Address', 'Shipping Address', 'Shipments', 'Payment Information'].each do |content|
        expect(page).to have_content(content)
      end
    end
  end

  context 'confirm' do
    background do
      order.addresses.billing.create(attributes_for(:address).stringify_keys)
      order.addresses.shipping.create(attributes_for(:address).stringify_keys)
      order.update(delivery: delivery)
      order.update(credit_card: credit_card)
      visit order_step_path(:confirm)
    end

    scenario 'check main elements on payment page' do
      ['Billing Address', 'Shipping Address', 'Shipments', 'Payment Information'].each do |content|
        expect(page).to have_content(content)
      end
    end

    scenario 'check order items presence' do
      expect(page).to have_selector('.cart-img-shadow.pull-left', count: order.order_items.count)
      order.order_items.each do |item|
        expect(page).to have_css('span', text: item.quantity)
        expect(page).to have_css('.title', text: item.book.title)
      end
    end

    scenario 'check addresses presence ' do
      order.addresses.each do |address|
        expect(page).to have_content("#{address.first_name} #{address.last_name}")
        expect(page).to have_content(address.address)
        expect(page).to have_content("#{address.city} #{address.zip}")
        expect(page).to have_content(address.country)
        expect(page).to have_content("Phone #{address.phone}")
      end
    end

    scenario 'confirming' do
      click_link('confirm-submit-btn')
      expect(page).to have_css('.general-subtitle', text: 'Thank You for your Order!')
    end
  end
end
