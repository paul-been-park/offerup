class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :seller_id
      t.string :title
      t.string :listing_title
      t.string :price
      t.string :category
      t.string :location
      t.string :status
      t.integer :buyer_id
      t.string :picture

      t.timestamps
    end
  end
end
