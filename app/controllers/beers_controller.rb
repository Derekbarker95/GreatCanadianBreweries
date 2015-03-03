class BeersController < ApplicationController

  before_action :find_beer, only: [:destroy, :update]
  before_action :find_brewery, only: [:destroy, :create, :new, :update]
  before_action :admin, only: [:new, :create, :edit, :update, :destroy]
 
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

 def destroy
    @beer.destroy
    redirect_to breweries_path
 end

 def edit
  end


  def update

    if @beer.update beer_params
      redirect_to @brewery
    else
      render :edit
    end
  end

 private 

  def find_brewery
    @brewery = Brewery.find params[:brewery_id]
  end

  def find_beer
    @beer = Beer.find params[:id]
  end

  def beer_params
    beer_params = params.require(:beer).permit(:name, :description, :style, :ibu, :abv, :color ) 
  end


end
