class Apartment < ActiveRecord::Base

  geocoded_by :full_address
  after_validation :geocode
  belongs_to :user
  resourcify

  def full_address
    street_address + " " + city + " " + state + " " + zip_code
  end

  has_attached_file :image, styles: { small: "64x64", med: "100x100>", large: "200x200>" }
  validates_attachment :image,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
      size: { in: 0..10.megabytes }

end
