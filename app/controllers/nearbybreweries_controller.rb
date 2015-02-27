class NearbybreweriesController < ApplicationController 

    def index
      @address = Geocoder.coordinates("Vancouver, BC, Canada")
      @brewery = Brewery.near(
        [@address[0], @address[1]],
        20, units: :km)
      @hash = Gmaps4rails.build_markers(@brewery) do |brewery, marker|
        marker.lat brewery.latitude
        marker.lng brewery.longitude
      end
    end
end