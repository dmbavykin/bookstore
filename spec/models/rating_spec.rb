require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { FactoryBot.create :rating }

  context 'validates' do
    %i[review rate].each do |field|
      it "invalid without #{field}" do
        should validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    %i[book customer].each do |field|
      it "belongs to #{field}" do
        should belong_to(field)
      end
    end
  end
end
