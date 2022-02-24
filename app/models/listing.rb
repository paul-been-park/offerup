require 'open-uri'
class Listing < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
