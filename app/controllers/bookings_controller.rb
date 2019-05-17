class BookingsController < ApplicationController
  def index
    if params[:user_id]
      @my_bookings = Booking.where(renter_id: params[:user_id])
      @their_bookings = Booking.joins(:vehicle).merge(Vehicle.where(owner_id: params[:user_id]))
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    @vehicle = Vehicle.find(params[:vehicle_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking.vehicle = @vehicle
    @booking.renter = current_user
    authorize @booking
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :number_of_nights)
  end
end
