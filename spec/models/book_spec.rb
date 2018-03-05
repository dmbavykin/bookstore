require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create :book }

  context 'validates' do
    %i[title price quantity].each do |field|
      it "invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    it 'belongs to category' do
      is_expected.to belong_to(:category)
    end

    it 'has and belongs to many to author' do
      is_expected.to have_and_belong_to_many(:author)
    end
  end
end
