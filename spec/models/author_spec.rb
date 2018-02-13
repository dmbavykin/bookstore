require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { FactoryBot.create :author }

  context 'validates' do
    %i[firstname lastname].each do |field|
      it "invalid without #{field}" do
        should validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    it 'has many books' do
      should have_many(:books)
    end
  end
end
