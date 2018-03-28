# frozen_string_literal: true

feature 'main page' do
  let(:book) { Book.last }
  let(:user) { create(:user) }

  background do
    create_list(:book, 4)
    visit root_path
  end

  scenario 'check presence of main elements' do
    expect(page).to have_content(I18n.t('main.slider_buy_btn'))
    expect(page).to have_content(I18n.t('main.welcome'))
    expect(page).to have_content(I18n.t('main.welcome_subphrase'))
    expect(page).to have_content(I18n.t('main.welcome_btn'))
    expect(page).to have_content(I18n.t('main.best_sellers'))
    expect(page).to have_css '.shop-icon'
  end

  scenario 'bestsellers block' do
    expect(page).to have_selector('.title', text: book.title)
    expect(page).to have_selector('p.font-16.in-gold-500', text: book.price.to_f)
  end

  scenario 'slider' do
    expect(page).to have_selector('.carousel.slide .item h1', text: book.title)
  end

  scenario 'navigation for unauthorized' do
    ['Home', 'Shop', 'Log In', 'Sign Up'].each do |title|
      expect(page).to have_selector('ul.nav', text: title)
    end
    find('.nav .dropdown').click
    Category.all.each { |category| expect(page).to have_selector('.dropdown-menu li', text: category.title) }
  end

  scenario 'navigation for authorized' do
    sign_in(user)
    ['Home', 'Shop', 'My Account'].each do |title|
      expect(page).to have_selector('ul.nav', text: title)
    end
    find('.nav .dropdown', text: 'My Account').click
    ['Orders', 'Settings', 'Log Out'].each do |title|
      expect(page).to have_selector('ul.nav', text: title)
    end
  end
end
