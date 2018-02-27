require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context 'check relations' do
    it "belongs to order" do
      is_expected.to belong_to(:order)
    end
  end
end
