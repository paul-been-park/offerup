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

  has_many :conversations, resource: MessageResource do
    assign_each do |user, messages|
      messages.select do |m|
        m.id.in?(user.conversations.map(&:id))
      end
    end
  end

  many_to_many :item_listings,
               resource: ListingResource

end
