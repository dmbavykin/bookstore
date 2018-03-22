class MakeReferencesForCreditCardAndOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :credit_cards, :user, index: true
    add_reference :orders, :credit_card, index: true
  end
end
