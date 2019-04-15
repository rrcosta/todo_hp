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

  context "scopes" do
    describe ".pending" do
      let!(:todo_pending){ create(:todo_list, done: false) }

      it 'returns all todolist done pending' do
        expect(
          described_class.all.pending.size
        ).to eql(1)
      end
    end

    describe ".completed" do
      let!(:todo_completed){ create(:todo_list, done: true) }

      it 'returns all todolist done completed' do
        expect(
          described_class.all.completed.size
        ).to eql(1)
      end
    end

    describe ".group_by_status" do
      let!(:todo_true) { create(:todo_list, done: true) }

      it 'returns the number of status/done' do
        expect(
          described_class.group_by_status
        ).to eql({true => 1})
      end
    end
  end
end
