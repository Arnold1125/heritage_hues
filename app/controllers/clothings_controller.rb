class ClothingsController < ApplicationController
  def show
    @booking = Booking.new
    @clothing = Clothing.find(params[:id])
  end

  def index
    @clothings = Clothing.all

    @markers = @clothings.geocoded.map do |clothing|
      {
        lat: clothing.latitude,
        lng: clothing.longitude
      }
    end
  end

  def new
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
    if @clothing.save
      redirect_to clothing_path(@clothing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def clothing_params
    params.require(:clothing).permit(:name, :price, :color, :size, :description)
  end


end
