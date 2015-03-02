class Brewery < ActiveRecord::Base

  has_many :beers
  has_many :features

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    full_address = [address, city, province, country].compact.join(', ')
  end 
  
end
