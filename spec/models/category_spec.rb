require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.create :category}

  context 'validates' do
    it 'invalid without title' do
      expect(FactoryBot.build :category, title: nil).not_to be_valid
    end

    it 'does not allow duplicate titles' do
      expect(FactoryBot.build :category, title: category.title).not_to be_valid
    end
  end
end
