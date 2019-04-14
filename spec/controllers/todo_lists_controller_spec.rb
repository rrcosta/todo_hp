require "rails_helper"

RSpec.describe TodoListsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:todo_list) { create(:todo_list, user: user) }

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
      get :show, params: { id: todo_list.to_param }

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    before { get :new }

    it { is_expected.to render_template(:new) }
  end

  describe "GET #edit" do
    it 'returns a success response' do
      get :edit, params: { id: todo_list.to_param, title: 'test' }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:user) { create(:user) }

    context "with valid params" do
      it 'creates a new todo_list' do
        expect {
          post :create, params: {
            todo_list: {
              title: 'foobar',
              description: 'baz',
              done: false,
              user_id: user.id
            }
          }
        }.to change(TodoList, :count).by(1)
      end
    end

    context "with invalid params" do
      it 'not creates a new todo_list' do
        expect {
          post :create, params: {
            todo_list: {
              title: nil,
              description: nil,
              done: false,
              user_id: user.id
            }
          }
        }.to change(TodoList, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    let(:todo_listId) { todo_list.id }

    context 'with valid params' do
      it 'changes register' do
        put :update, params: { id: todo_listId,
                               todo_list: { title: 'zooo',
                                            description: 'change idea',
                                          }
                              }

        expect(response.content_type).to eq('text/html')
        expect(response.status).to eq(302)
      end
    end

    context 'with invalid params' do
      it 'changes register' do
        put :update, params: { id: todo_listId,
                               todo_list: { title: nil,
                                            description: nil,
                                          }
                              }

        expect(response.content_type).to eq('text/html')
        expect(response.status).not_to eq(302)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:todo_list) { create_list(:todo_list, 2, user: user) }
    let(:todo_list1) { todo_list[1].id }

    it "destoy the requested todo_list" do
      expect{
        delete :destroy, params: { id: todo_list1 }
      }.to change(TodoList, :count)
    end
  end
end
