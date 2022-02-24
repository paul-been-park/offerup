class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :listing_id
      t.integer :prospective_buyer_id

      t.timestamps
    end
  end
end
