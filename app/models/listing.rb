class Listing < ApplicationRecord
  mount_base64_uploader :picture, PictureUploader

  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  belongs_to :seller,
             :class_name => "User"

  # Indirect associations

  has_one    :message,
             :through => :seller,
             :source => :messages

  has_many   :prospective_buyers,
             :through => :messages,
             :source => :prospective_buyer

  # Validations

  # Scopes

  def to_s
    seller.to_s
  end

end
