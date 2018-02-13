require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryBot.create :customer }

  context 'validates' do
    %i[email password firstname lastname].each do |field|
      it "invalid without #{field}" do
        should validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    %i[orders ratings].each do |field|
      it "has many #{field}" do
        should have_many(field)
      end
    end
  end
end
