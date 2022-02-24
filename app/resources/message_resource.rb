class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :listing_id, :integer
  attribute :prospective_buyer_id, :integer

  # Direct associations

  belongs_to :listing

  belongs_to :prospective_buyer,
             resource: UserResource

  # Indirect associations

  has_one    :seller,
             resource: UserResource

  filter :seller_id, :integer do
    eq do |scope, value|
      scope.eager_load(:seller).where(:listings => {:seller_id => value})
    end
  end
end
