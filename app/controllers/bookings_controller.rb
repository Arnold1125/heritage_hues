class BookingsController < ApplicationController
  def index
    @clothing = Clothing.find(params[:clothing_id])
    @bookings = Booking.where(clothing: @clothing)
  end

  def new
    @clothing = Clothing.find(params[:clothing_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @clothing = Clothing.find(params[:clothing_id])
    @booking.clothing = @clothing
    @booking.user = @clothing.user
    if @booking.save
      redirect_to clothing_bookings_path(@clothing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    # Combine year, month, and day into a Date object for start_date and end_date
    params.require(:booking).permit(:start_date, :end_date)
  end
end
