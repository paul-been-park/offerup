json.extract! user, :id, :name, :prospective_buyer_id, :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt
