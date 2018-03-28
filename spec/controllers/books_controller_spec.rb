describe BooksController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe 'GET #show' do
    context 'assigns' do
      it 'assigns variables' do
        allow(controller).to receive(:current_user).and_return user
        get :show, params: { id: book.id }
        expect(assigns(:book)).not_to be_nil
        expect(assigns(:reviews)).not_to be_nil
      end

      it 'does not assign @review' do
        allow(controller).to receive(:current_user).and_return nil
        get :show, params: { id: book.id }
        expect(assigns(:review)).to be_nil
      end
    end

    describe 'successful rendering' do
      before { get :show, params: { id: book.id } }
      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders :show template' do
        expect(response).to render_template(:show)
      end
    end
  end
end
