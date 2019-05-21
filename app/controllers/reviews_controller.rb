class ReviewsController < ApplicationController
  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.vehicle = Vehicle.find(params[:vehicle_id])
    @review.user = current_user
    @review.save
    authorize @review
    redirect_to vehicle_path(@review.vehicle)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
