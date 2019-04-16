require "rails_helper"

# TodoList Controller
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

  describe "GET #pending" do
    let(:params) do
      {
        title: "foobar",
        description: "saron roses",
        done: false,
        user_id: user.id
      }
    end

    it "#pending" do
      expect(
        get :pending, params: { todo_list: params }
      ).to render_template("todo_lists/pending")
    end
  end

  describe "GET #completed" do
    let(:params) do
      {
        title: "foobar",
        description: "saron roses",
        done: true,
        user_id: user.id
      }
    end

    it "#completed" do
      expect(
        get :completed, params: { todo_list: params }
      ).to render_template("todo_lists/completed")
    end
  end

  describe "GET #dashboard" do
    let(:params) do
      {
        title: "foobar",
        description: "saron roses",
        done: true,
        user_id: user.id
      }
    end

    it "#dashboard" do
      expect(
        get :dashboard, params: { todo_list: params }
      ).to render_template("todo_lists/dashboard")
    end
  end

  describe "GET #show" do
    let!(:user2) { create(:user) }
    let!(:todo_list2) { create(:todo_list, user: user2) }

    it "returns a success response" do
      get :show, params: { id: todo_list.to_param }

      expect(response).to be_successful
    end

    it "render not found page" do
      get :show, params: { id: todo_list2.to_param }

      expect(response.status).to be(404)
    end
  end

  describe "GET #new" do
    before { get :new }

    it { is_expected.to render_template(:new) }
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: todo_list.to_param, title: "test" }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:user) { create(:user) }

    context "with valid params" do
      it "creates a new todo_list" do
        expect do
          post :create, params: {
            todo_list: {
              title: "foobar",
              description: "baz",
              done: false,
              user_id: user.id
            }
          }
        end.to change(TodoList, :count).by(1)
      end
    end

    context "with invalid params" do
      it "not creates a new todo_list" do
        expect do
          post :create, params: {
            todo_list: {
              title: nil,
              description: nil,
              done: false,
              user_id: user.id
            }
          }
        end.to change(TodoList, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    let(:todo_listId) { todo_list.id }

    context "with valid params" do
      it "changes register" do
        put :update, params: { id: todo_listId,
                               todo_list: { title: "zooo",
                                            description: "change idea",
                                          }
                              }

        expect(response.content_type).to eq("text/html")
        expect(response.status).to eq(302)
      end
    end

    context "with invalid params" do
      it "changes register" do
        put :update, params: { id: todo_listId,
                               todo_list: { title: nil,
                                            description: nil,
                                          }
                              }

        expect(response.content_type).to eq("text/html")
        expect(response.status).not_to eq(302)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:todo_list) { create_list(:todo_list, 2, user: user) }
    let(:todo_list1) { todo_list[1].id }

    it "destoy the requested todo_list" do
      expect  do
        delete :destroy, params: { id: todo_list1 }
      end.to change(TodoList, :count)
    end
  end
end
