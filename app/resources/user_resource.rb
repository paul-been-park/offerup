class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :prospective_buyer_id, :string

  # Direct associations

  has_many   :messages,
             foreign_key: :prospective_buyer_id

  has_many   :listings,
             foreign_key: :seller_id

  # Indirect associations

end
