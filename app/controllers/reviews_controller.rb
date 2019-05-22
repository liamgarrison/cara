class ReviewsController < ApplicationController
  # def new
  #   @vehicle = Vehicle.find(params[:vehicle_id])
  #   @review = Review.new
  #   authorize @review
  # end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user
    @reviews = Review.where(booking: @booking)
    authorize @booking
    if @review.save
      redirect_to booking_path(@review.booking)
    else
      render 'bookings/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
