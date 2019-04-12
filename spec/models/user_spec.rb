require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    let(:user) { create(:user) }

    it 'is valid with name field' do
      expect(user).to be_valid
    end
  end
end
