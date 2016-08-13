class Listing < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    street_address_1 + " " + street_address_2 + " " + city + " " + state + " " + postal_code + " " + country
  end
end
