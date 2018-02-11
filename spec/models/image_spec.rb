require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { FactoryBot.create :image }

  context 'validates' do
    it "invalid without path" do
      should validate_presence_of(:path)
    end
  end

  context 'check relations' do
    it "belongs to book" do
      should belong_to(:book)
    end
  end
end
