class AddLocationLatitudeToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :location_latitude, :float
  end
end
