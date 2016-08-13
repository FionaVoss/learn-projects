json.array!(@animals) do |animal|
  json.extract! animal, :id, :common_name, :latin_name, :kingdom
  json.url animal_url(animal, format: :json)
end
