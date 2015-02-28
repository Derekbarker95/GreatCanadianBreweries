class ReviewsController < ApplicationController

before_action :find_review, only: [:destroy]
before_action :find_beer, only: [:destroy, :create]

before_action :authorize

def create
  @review = Review.new review_params
  @review.beer = @beer
  @review.user = current_user
  @review.save
  redirect_to @beer.brewery
end

private

  def find_beer
    @beer = Beer.find params[:beer_id]
  end

  def find_review
    @review = Review.find params[:id]
  end

  def review_params
    params.require(:review).permit(:body)
  end

end
