class Animal < ActiveRecord::Base
  validates :common_name, presence: true
  has_many :sightings
end
