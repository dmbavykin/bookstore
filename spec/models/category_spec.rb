require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.create :category }

  context 'validates' do
    subject { FactoryBot.build(:category) }

    it 'invalid without title' do
      should validate_presence_of(:title)
    end

    it 'does not allow duplicate titles' do
      should validate_uniqueness_of(:title)
    end
  end

  context 'check relations' do
    it 'has many books' do
      should have_many(:books)
    end
  end
end
