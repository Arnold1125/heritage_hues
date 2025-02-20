class ClothingsController < ApplicationController
  def show
    @booking = Booking.new
    @clothing = Clothing.find(params[:id])
  end

  def index
    if params[:q].present?
      @clothings = Clothing.search_by_name_and_description_and_country(params[:q])
    else
      @clothings = Clothing.all
    end
  end

  def new
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
    @clothing.user = current_user

    if params[:clothing][:photo].present?
      puts "Photo uploaded: #{params[:clothing][:photo].original_filename}"
    else
      puts "No photo uploaded"
    end


    if @clothing.save
      redirect_to owner_bookings_path(@clothing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def clothing_params
    params.require(:clothing).permit(:name, :price, :color, :size, :description, :country, :photo)
  end
end
