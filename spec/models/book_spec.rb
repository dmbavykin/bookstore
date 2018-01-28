require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create :book }

  context 'validates' do
    %i(title price quantity).each do |field|
      it "invalid without #{field}" do
        should validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    %i(author category).each do |field|
      it "belongs to #{field}" do
        should belong_to(field)
      end
    end
  end
end
