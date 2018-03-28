# frozen_string_literal: true

describe ReviewsController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:review_params) { FactoryBot.attributes_for(:review).stringify_keys }
  let(:invalid_review_params) { FactoryBot.attributes_for(:review, :invalid).stringify_keys }

  before { allow(controller).to receive(:current_user).and_return(user) }

  describe 'POST #create' do
    context 'with valid attributes' do
      before do
        post :create, params: { book_id: book.id, review: review_params }
      end

      it 'redirects to user settings page' do
        expect(response).to redirect_to(book_path(book))
      end

      it 'sends notice' do
        expect(flash[:notice]).to eq I18n.t('review.successful.create')
      end

      it 'creates review record' do
        expect { post :create, params: { book_id: book.id, review: review_params } }.to change(Review, :count).by(1)
      end
    end

    context 'with invalid params' do
      before { post :create, params: { book_id: book.id, review: invalid_review_params } }
      it 'redirects to user settings page' do
        expect(response).to redirect_to(book_path(book))
      end

      it 'sends notice' do
        expect(flash[:alert]).to eq I18n.t('review.failure.create')
      end
    end
  end
end
