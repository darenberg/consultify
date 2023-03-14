class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    if @booking.save
      redirect_to offer_booking_path
    else
      render @offer, status: :unprocessable_entity
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to offer_booking_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:intitial_time, :end_time, :status, :offer_id, :student_id)
  end
end
