class ListingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :seller_id, :integer
  attribute :title, :string
  attribute :listing_title, :string
  attribute :price, :string
  attribute :category, :string
  attribute :location, :string
  attribute :status, :string
  attribute :buyer_id, :integer
  attribute :picture, :string

  # Direct associations

  has_many   :messages

  belongs_to :seller,
             resource: UserResource

  # Indirect associations

  has_one    :message
  many_to_many :prospective_buyers,
               resource: UserResource
end
