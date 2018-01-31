require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create :order }

  context 'validates' do
    %i(total_price completed_date state).each do |field|
      it "invalid without #{field}" do
        should validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    %i(customer credit_card).each do |field|
      it "belongs to #{field}" do
        should belong_to(field)
      end
    end

    %i(billing_address shipping_address).each do |field|
      it "has one #{field}" do
        should have_one(field)
      end
    end
  end
end
