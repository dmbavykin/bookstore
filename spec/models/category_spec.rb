# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.create :category }

  context 'validates' do
    subject { FactoryBot.build(:category) }

    it 'invalid without title' do
      is_expected.to validate_presence_of(:title)
    end

    it 'does not allow duplicate titles' do
      is_expected.to validate_uniqueness_of(:title)
    end
  end

  context 'check relations' do
    it 'has many books' do
      is_expected.to have_many(:books)
    end
  end
end
