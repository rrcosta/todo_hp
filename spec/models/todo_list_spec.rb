require "rails_helper"

RSpec.describe TodoList, type: :model do
  context "Associations" do
    it { is_expected.to belong_to :user }
  end

  context "validations" do
    let(:todo_list) { create(:todo_list) }

    it "is valid with name field" do
      expect(todo_list).to be_valid
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
