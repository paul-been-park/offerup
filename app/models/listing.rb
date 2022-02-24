class Listing < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  belongs_to :seller,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    seller.to_s
  end

end
