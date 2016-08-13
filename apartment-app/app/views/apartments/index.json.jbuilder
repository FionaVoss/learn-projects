json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :street_address, :city, :state, :zip_code, :contact_name, :contact_email, :latitude, :longitude
  json.url apartment_url(apartment, format: :json)
end
