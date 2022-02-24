json.extract! listing, :id, :seller_id, :title, :listing_title, :price,
              :category, :location, :status, :buyer_id, :picture, :created_at, :updated_at
json.url listing_url(listing, format: :json)
