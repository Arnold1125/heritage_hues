class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    if params[:status] == "accepted"
      @bookings = Booking.where(user: current_user, status: "accepted")
    elsif params[:status] == "pending"
      @bookings = Booking.where(user: current_user, status: "pending")
    elsif params[:status] == "rejected"
      @bookings = Booking.where(user: current_user, status: "rejected")
    end

  end

  def new
    @clothing = Clothing.find(params[:clothing_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @clothing = Clothing.find(params[:clothing_id])
    @booking.clothing = @clothing
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path
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
