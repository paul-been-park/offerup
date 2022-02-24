class Message < ApplicationRecord
  # Direct associations

  belongs_to :listing,
             :counter_cache => true

  belongs_to :prospective_buyer,
             :class_name => "User"

  # Indirect associations

  has_one    :conversation,
             :through => :prospective_buyer,
             :source => :listings

  has_one    :seller,
             :through => :listing,
             :source => :seller

  # Validations

  # Scopes

  def to_s
    listing.to_s
  end

end
