class AddProspectiveBuyerReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :prospective_buyer_id
    add_index :messages, :prospective_buyer_id
    change_column_null :messages, :prospective_buyer_id, false
  end
end
