require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { FactoryBot.create :author }

  context 'validates' do
    it 'invalid without firstname' do
      expect(FactoryBot.build :author, firstname: nil).not_to be_valid
    end

    it 'invalid without lastname' do
      expect(FactoryBot.build :author, lastname: nil).not_to be_valid
    end

  end
end
