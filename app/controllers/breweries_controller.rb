class BreweriesController < ApplicationController
  before_action :find_brewery, only: [:show, :edit, :update, :destroy]

 def new 
  @brewery = Brewery.new
   render :new 
 end 

 def create 
  @brewery = Brewery.new brewery_params
  @brewery.save
  redirect_to @brewery
 end 

 def show 
  @beer = Beer.new
  @beers = @brewery.beers
 end

 def index
  @brewery = Brewery.order(:id)
 end

 def destroy
    @brewery.destroy
    redirect_to breweries_path
 end

 private 

  def full_address
    full_address = [address, city, province, country].compact.join(', ')
  end 

  def find_brewery
    @brewery = Brewery.find params[:id]
  end

  def brewery_params
    brewery_params = params.require(:brewery).permit(:name, :description, :address, :province, :city, :phone ) 
  end


  
end
