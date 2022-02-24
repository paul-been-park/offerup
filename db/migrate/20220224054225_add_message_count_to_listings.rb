class AddMessageCountToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :messages_count, :integer
  end
end
