# frozen_string_literal: true

feature 'categories page' do
  let(:user) { create(:user) }
  let!(:book) { create(:book).decorate }
  let!(:review) { create(:review, confirmed: true, book: book) }

  background do
    visit book_path(book)
  end

  scenario 'check main elements' do
    expect(page).to have_css('h1', text: book.title)
    expect(page).to have_css('p', text: book.authors_names)
    expect(page).to have_css('p', text: book.price.to_f)
    expect(page).to have_css('p', text: book.description)
    expect(page).to have_css('p', text: book.dimensions)
  end

  scenario 'buy a book' do
    find('.order_items .btn').click
    expect(page).to have_css('.alert-success', text: I18n.t('cart.successful_added'))
  end

  scenario 'reviews exists' do
    expect(page).to have_css('.general-message-name', text: review.name)
    expect(page).to have_css('p', text: review.comment_text)
  end

  scenario 'make a review' do
    sign_in(user, book_path(book))
    fill_in 'review_name', with: review.name
    fill_in 'review_comment_text', with: review.comment_text
    find('.review .btn').click
    expect(page).to have_css('.alert-success', text: I18n.t('review.successful.create'))
  end
end
