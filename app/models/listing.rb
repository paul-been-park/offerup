class Listing < ApplicationRecord
  # Direct associations

  belongs_to :seller,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    seller.to_s
  end

end
