class AddListingReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :listings
    add_index :messages, :listing_id
    change_column_null :messages, :listing_id, false
  end
end
