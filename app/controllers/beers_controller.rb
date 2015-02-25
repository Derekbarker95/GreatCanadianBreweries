class BeersController < ApplicationController

  before_action :find_beer, only: [:destroy]
  before_action :find_brewery, only: [:destroy, :create, :new]
 
 def new
  @beer = Beer.new
  @beer.brewery = @brewery
 end

 def create 
    @beer = Beer.new beer_params
    @beer.brewery = @brewery
    @beer.save
    redirect_to @brewery
 end 

 private 

  def find_brewery
    @brewery = Brewery.find params[:brewery_id]
  end

  def find_beer
    @beer = Beer.find params[:id]
  end

  def beer_params
    brewery_params = params.require(:beer).permit(:name, :description, :style, :ibu, :abv, :color ) 
  end


end
