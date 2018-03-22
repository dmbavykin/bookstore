require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { FactoryBot.create :review }

  context 'validates' do
    %i[comment_text name].each do |field|
      it "invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context 'check relations' do
    %i[book user].each do |field|
      it "belongs to #{field}" do
        is_expected.to belong_to(field)
      end
    end
  end
end
