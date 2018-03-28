# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { FactoryBot.create :image }

  context 'validates' do
    it 'invalid without path' do
      is_expected.to validate_presence_of(:path)
    end
  end

  context 'check relations' do
    it 'belongs to book' do
      is_expected.to belong_to(:book)
    end
  end
end
