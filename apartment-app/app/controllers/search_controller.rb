class SearchController < ApplicationController
  def index
    @apartments = Apartment.basic_search(params[:query])
    @hash = Gmaps4rails.build_markers(@apartments.where.not(latitude: nil)) do |apartment, marker|
        marker.lat apartment.latitude
        marker.lng apartment.longitude
    end
    render '/apartments/index.html.erb'
  end
end
