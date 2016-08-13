json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :street_address_1, :street_address_2, :city, :state, :postal_code, :country
  json.url listing_url(listing, format: :json)
end
