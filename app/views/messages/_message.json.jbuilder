json.extract! message, :id, :listing_id, :prospective_buyer_id, :created_at, :updated_at
json.url message_url(message, format: :json)
