require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let!(:order) { create(:order, user: user) }
  let!(:order_item) { create(:order_item, order: order, book: book) }
  let(:order_item_params) { FactoryBot.attributes_for(:order_item, book_id: create(:book).id).stringify_keys }

  before { allow(controller).to receive(:current_user).and_return(user) }

  describe 'GET #index' do
    before { get :index, session: { order_id: order.id } }

    it 'assigns @items' do
      expect(assigns(:items)).not_to be_nil
    end

    it 'renders :index template' do
      expect(response).to render_template(:index)
    end

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    context 'successful response' do
      before do
        post :create, params: { order_items: order_item_params }
      end

      it 'redirects to cart page' do
        expect(response).to redirect_to(order_items_path)
      end

      it 'sends notice' do
        expect(flash[:notice]).to eq I18n.t('cart.successful_added')
      end
    end

    context 'book alredy added' do
      before do
        post :create, params: { order_items: { book_id: order_item.book.id } }, session: { order_id: order.id }
      end

      it 'redirects to cart page' do
        expect(response).to redirect_to(order_items_path)
      end

      it 'sends notice' do
        expect(flash[:alert]).to eq I18n.t('cart.alredy_added')
      end
    end

    it 'creates order item record' do
      expect { post :create, params: { order_items: order_item_params } }.to change(OrderItem, :count).by(1)
    end
  end

  describe 'PUT #update' do
    it 'redirects to cart page' do
      put :update, params: { id: order_item.id, order_items: order_item_params }
      expect(response).to redirect_to(order_items_path)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: order_item.id }, session: { order_id: order.id } }

    it 'removes iten from cart' do
      expect(OrderItem.find_by(id: order_item.id)).to be_nil
    end

    it 'sends notice' do
      expect(flash[:notice]).to eq I18n.t('cart.removed_successful')
    end
  end
end
