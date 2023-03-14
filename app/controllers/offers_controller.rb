class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy ]

  def index
    @offers = Offer.all

  end

  def show
    @booking = Booking.new
  end

  def new
    @offer = Offer.new

  end

  def create
    @offer = Offer.new(offer_params)

    @offer.user = current_user

    if @offer.save!
      redirect_to @offer
    else
      render :new
    end
  end

  def edit

  end


  def update

    @offer.update(offer_params)
    redirect_to offer_path(@offer), notice: 'offer was successfully updated.'
  end

  def destroy

    @offer.destroy
    redirect_to offers_path, notice: 'offer was successfully destroyed.'
  end

  private

  def offer_params
    params.require(:offer).permit(:category, :title, :description, :qualifications)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
