class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @review = Review.new(review_params)
    @review.offer = @offer
    @review.user = current_user
    if @review.save
      redirect_to offer_path(@offer)
    else
      render "offers/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
