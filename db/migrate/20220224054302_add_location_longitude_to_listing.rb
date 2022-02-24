class AddLocationLongitudeToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :location_longitude, :float
  end
end
