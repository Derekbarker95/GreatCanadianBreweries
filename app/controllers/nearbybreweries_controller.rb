class NearbybreweriesController < ApplicationController 

    def index
      @search = params[:search] || current_city
      @address = Geocoder.coordinates(@search + ", Canada")
      @brewery = Brewery.near(
        [@address[0], @address[1]],
        20, units: :km)
      @hash = Gmaps4rails.build_markers(@brewery) do |brewery, marker|
        marker.lat brewery.latitude
        marker.lng brewery.longitude

        marker.infowindow "#{brewery.name}"

      end
    end

    private

    def current_city
      city = request.location.city
      if city.blank?
        "Vancouver"
      else
        city
      end
    end
end