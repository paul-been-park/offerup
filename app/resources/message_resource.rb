class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :listing_id, :integer
  attribute :prospective_buyer_id, :integer

  # Direct associations

  belongs_to :prospective_buyer,
             resource: UserResource

  # Indirect associations

end
