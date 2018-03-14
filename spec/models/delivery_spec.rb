require 'rails_helper'

RSpec.describe Delivery, type: :model do
  let(:delivery) { FactoryBot.create :delivery }

  context 'validates' do
    %i[title days price].each do |field|
      it "invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    it 'has many orders' do
      is_expected.to have_many(:orders)
    end
  end
end
