require 'rails_helper'

RSpec.describe Course, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:registration_code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it do
      create(:course)
      should validate_uniqueness_of(:registration_code)
    end
  end
end
