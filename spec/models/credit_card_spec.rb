require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  let(:credit_card) { FactoryBot.create :credit_card }

  context 'validates' do
    %i[number cvv expiration_month expiration_year first_name last_name].each do |field|
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
