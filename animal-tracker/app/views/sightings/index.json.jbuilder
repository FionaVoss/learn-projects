json.array!(@sightings) do |sighting|
  json.extract! sighting, :id, :date, :latitude, :longitude, :animal_id
  json.url sighting_url(sighting, format: :json)
end
