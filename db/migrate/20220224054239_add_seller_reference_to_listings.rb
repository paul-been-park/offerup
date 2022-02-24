class AddSellerReferenceToListings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :listings, :users, column: :seller_id
    add_index :listings, :seller_id
    change_column_null :listings, :seller_id, false
  end
end
