require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user, name: 'foo') }

  before do
    sign_in user
    get :index
  end

  describe "GET #index" do
    before { get :index }

    it { is_expected.to render_template(:index) }
  end

  describe "GET #show" do
    it 'returns a success response' do
      get :show, params: { id: user.to_param }

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    before { get :new }

    it { is_expected.to render_template(:new) }
  end

  describe "GET #edit" do
    it 'returns a success response' do
      get :edit, params: { id: user.to_param, name: 'Foox' }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it 'creates a new user' do
        expect {
          post :create, params: {
            user: {
              name: 'bar',
              email: 'foo@bar.com',
              password: '12345678',
              password_confirmation: '12345678'
            }
          }
        }.to change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'not creates a new user' do
        expect {
          post :create, params: { user: { name: nil } }
        }.to change(User, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:user) { create(:user) }
      let(:userId) { user.id }

      it 'changes register' do
        put :update, params: { id: userId, user: { name: 'baz' } }

        expect(response.content_type).to eq('text/html')
        expect(response.status).to eq(302)
      end
    end

    context 'with invalid params' do
      let(:user) { create(:user) }
      let(:userId) { user.id }

      it 'changes register' do
        put :update, params: { id: userId, user: { name: nil } }

        expect(response.content_type).to eq('text/html')
        expect(response.status).not_to eq(302)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user_list) { create_list(:user, 2) }
    let(:user1) { user_list[1].id }

    it 'destroy the requested user' do
      expect {
        delete :destroy, params: { id: user1 }
      }.to change(User, :count)
    end
  end
end
