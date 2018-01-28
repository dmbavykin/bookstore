require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create :book }

  context 'validates' do
    it 'invalid without title' do
      expect(FactoryBot.build :book, title: nil).not_to be_valid
    end

    it 'invalid without price' do
      expect(FactoryBot.build :book, price: nil).not_to be_valid
    end

    it 'invalid without quantity' do
      expect(FactoryBot.build :book, quantity: nil).not_to be_valid
    end

  end
end
