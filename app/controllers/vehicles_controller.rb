class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search_params = search_params
    @vehicles = policy_scope(Vehicle).all

    if @search_params[:location] && @search_params[:location] != "" && @search_params[:distance] && @search_params[:distance] != ""
      # Filter by distance when location and distance presence
      @vehicles = @vehicles.near(@search_params[:location], search_params[:distance])
      @vehicles.each { |vehicle| vehicle[:distance] = vehicle.distance_to(@search_params[:location]).round }
      @vehicles = @vehicles.sort_by { |vehicle| vehicle[:distance] }
    end

    if @search_params[:price_per_night] && @search_params[:price_per_night] != ""
      @vehicles = @vehicles.select { |vehicle| vehicle.price_per_night < @search_params[:price_per_night] }
    end
    @markers = generate_markers(@vehicles)
  end

  def show
    authorize @vehicle
    @markers = [{ lat: @vehicle.latitude, lng: @vehicle.longitude }]
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
    search_params[:start_date] = params[:start_date]
    search_params[:end_date] = params[:end_date]
    search_params[:berths] = params[:berths]
    search_params[:vehicle_type] = params[:vehicle_type]
    search_params[:distance] = params[:distance]
    search_params[:price_per_night] = params[:price_per_night].to_i
    search_params[:distance] = params[:distance]
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
