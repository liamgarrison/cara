class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # Call private method for search params
    @search_params = search_params
    if params[:user_id]
      # Admin vehicles page
      @vehicles = policy_scope(Vehicle).where(owner_id: params[:user_id])
    elsif @search_params[:location].nil? || @search_params[:location] == ""
      # Show all vehicles if no search term
      @vehicles = policy_scope(Vehicle).all
      @markers = generate_markers(@vehicles)
    else
      # Search vehicles page with location
      @vehicles = policy_scope(Vehicle).near(@search_params[:location], search_params[:distance])
      @markers = generate_markers(@vehicles)
    end
  end

  def show
    authorize @vehicle
  end

  def new
    @vehicle = Vehicle.new
    @user = User.find(params[:user_id])
    authorize @vehicle
  end

  def edit
    authorize @vehicle
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.owner = current_user
    authorize @vehicle
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      authorize @vehicle
      redirect_to vehicle_path(@vehicle)
    else
      render :edit
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path
    authorize @vehicle
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :berths, :address, :price_per_night, :category, :description, :photo)
  end

  def search_params
    search_params = {}
    search_params[:location] = params[:location]
    search_params[:dates] = [params[:start_date], params[:end_date]]
    search_params[:berths] = params[:berths]
    search_params[:vehicle_type] = params["vehicle-type"]
    search_params[:distance] = params[:distance]
    search_params[:price_per_night] = params["price-per-night"]
    search_params[:distance] = 100 if search_params[:distance].nil?
    return search_params
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def generate_markers(vehicles)
    vehicles.map do |vehicle|
      { lat: vehicle.latitude, lng: vehicle.longitude }
    end
  end
end
