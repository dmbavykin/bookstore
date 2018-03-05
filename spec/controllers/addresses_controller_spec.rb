require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  let(:user) { create(:user) }
  let(:address) { FactoryBot.build_stubbed(:address) }
  let(:address_params) { FactoryBot.attributes_for(:address, :shipping).stringify_keys }
  let(:invalid_address_params) { FactoryBot.attributes_for(:address, :invalid).stringify_keys }

  before { allow(controller).to receive(:current_user).and_return(user) }

  describe 'POST #create' do
    context 'with valid attributes' do
      before { post :create, params: { address: address_params } }

      it 'redirects to user settings page' do
        expect(response).to redirect_to(edit_user_registration_path)
      end

      it 'sends notice' do
        expect(flash[:notice]).to eq I18n.t('address.successful.create')
      end

      it 'creates address record' do
        expect { post :create, params: { address: address_params } }.to change(Address, :count).by(1)
      end
    end

    context 'with invalid params' do
      before { post :create, params: { address: invalid_address_params } }
      it 'redirects to user settings page' do
        expect(response).to redirect_to(edit_user_registration_path)
      end

      it 'sends notice' do
        expect(flash[:alert]).to eq I18n.t('address.failure.create')
      end
    end
  end

  describe 'PUT #update' do
    before do
      allow(address).to receive(:update).and_return true
      allow(Address).to receive(:find).and_return address
      allow(controller).to receive(:current_user).and_return user
    end

    context 'with valid attributes' do
      before { put :update, params: { id: address.id, address: address_params } }
      it 'assigns @address' do
        expect(assigns(:address)).not_to be_nil
      end

      it 'sends success notice' do
        expect(flash[:notice]).to eq I18n.t('address.successful.update')
      end

      it 'redirects to user settings page' do
        expect(response).to redirect_to(edit_user_registration_path)
      end
    end

    context 'with forbidden attributes' do
      it 'generates ParameterMissing error without address params' do
        expect { put :update, params: { id: address.id } }.to raise_error(ActionController::ParameterMissing)
      end
    end

    context 'with invalid attributes' do
      before { put :update, params: { id: address.id, address: invalid_address_params } }

      it 'sends error flash' do
        expect(flash[:alert]).to eq I18n.t('address.failure.update')
      end

      it 'redirects to user settings page' do
        expect(response).to redirect_to(edit_user_registration_path)
      end
    end
  end
end
