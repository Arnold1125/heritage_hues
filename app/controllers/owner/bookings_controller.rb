class Owner::BookingsController < ApplicationController
  def index
    @bookings = current_user.owner_bookings.order(updated_at: :desc)
    if params[:status].present?
      @bookings = @bookings.where(status: params[:status])
    end
  end

  def update
    @booking = Booking.find(params[:id])
    redirect_to owner_bookings_path if @booking.update(booking_params)
  end

  def booking_params
    # Combine year, month, and day into a Date object for start_date and end_date
    params.require(:booking).permit(:status)
  end
end
