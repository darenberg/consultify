class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy ]

  def index
    if params[:query]
      sql_query = <<~SQL
        offers.title @@ :query
        OR offers.category @@ :query
        OR offers.description @@ :query
        OR users.email @@ :query
      SQL
      @offers = Offer.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    elsif params[:category].present?
      @offers = Offer.where(category: params[:category])
    else
      @offers = Offer.all
    end
<<<<<<< HEAD
    @categories = @offers.map(&:category).uniq.first(10)
  end

=======


  end
>>>>>>> e546a7a7bc9e392fc5959fff21df1cdea8b32a82
  def show
    @booking = Booking.new
  end

  def offers_teacher
    @offers = Offer.all
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
