class Sighting < ActiveRecord::Base
  validates :date, presence: true
  belongs_to :animal
end
