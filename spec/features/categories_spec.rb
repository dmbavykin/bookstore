# frozen_string_literal: true

feature 'categories page' do
  let!(:photo) { create(:category, title: 'Photo') }
  let!(:web) { create(:category, title: 'Web') }

  background do
    create_list(:book, 24, category: photo)
    create_list(:book, 24, category: web)
    visit categories_path
  end

  scenario 'check presence of main elements' do
    expect(page).to have_content(I18n.t('catalog.all_categories_title'))
    expect(page).to have_content(I18n.t('catalog.all_categories'))
    expect(page).to have_css('.pagination')
    expect(page).to have_selector('.general-thumb-wrap', count: 12)
    [web.title, photo.title, I18n.t('catalog.all_categories')].each do |category|
      expect(page).to have_css('li', text: category)
    end
  end

  %i[web photo].each do |category|
    scenario "check category #{category}" do
      first('.filter-link', text: public_send(category).title).click
      expect(page).to have_content(public_send(category).title)
      expect(page).to have_css('.pagination')
      expect(page).to have_selector('.general-thumb-wrap', count: 12)
    end
  end

  context 'filters' do
    background { click_link('filters-md') }

    scenario 'check filter exists' do
      Book::FILTERS.each do |filter|
        expect(page).to have_css('li a', text: I18n.t("book.filters.#{filter}"))
      end
    end

    Book::FILTERS.each do |filter|
      scenario "check filter #{filter} works" do
        first('a', text: I18n.t("book.filters.#{filter}")).click
        expect(page).to have_content(I18n.t('catalog.all_categories_title'))
        expect(page).to have_content(I18n.t('catalog.all_categories'))
        expect(page).to have_css('.pagination')
        expect(page).to have_css('#filters-md', text: I18n.t("book.filters.#{filter}"))
        expect(page).to have_selector('.general-thumb-wrap', count: 12)
      end
    end
  end

  context 'pagination' do
    scenario 'paginate second page' do
      find('.pagination a', text: '2').click
      expect(page).to have_content(I18n.t('catalog.all_categories_title'))
      expect(page).to have_content(I18n.t('catalog.all_categories'))
      expect(page).to have_css('.pagination')
      expect(page).to have_css('#filters-md')
      expect(page).to have_selector('.general-thumb-wrap', count: 12)
    end
  end

  scenario 'adding book to cart' do
    first('.shopping-cart-buy-btn').click
    expect(page).to have_css('.alert-success', text: I18n.t('cart.successful_added'))
  end

  scenario 'show book' do
    first('.eye-show-book-btn').click
    expect(page).to have_css('.img-responsive')
  end
end
