require "rails_helper"

describe ApplicationHelper do
  describe "#plural_model_name" do
    it "returns given model's plural name" do
      expect(helper.plural_model_name(User)).to eq "Usuarios"
    end
  end
end
