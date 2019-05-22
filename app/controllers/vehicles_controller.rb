class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search_params = search_params
    @vehicles = policy_scope(Vehicle).all

    if @search_params[:location] && @search_params[:distance]
      # Filter by distance when location and distance presence
      @vehicles = @vehicles.near(@search_params[:location], search_params[:distance])
      @vehicles.each { |vehicle| vehicle[:distance] = vehicle.distance_to(@search_params[:location]).round }
      @vehicles = @vehicles.sort_by { |vehicle| vehicle[:distance] }
    end

    if @search_params[:price_per_night]
      @vehicles = @vehicles.select { |vehicle| vehicle.price_per_night < @search_params[:price_per_night] }
    end

    if @search_params[:berths]
      @vehicles = @vehicles.select { |vehicle| vehicle.berths == @search_params[:berths] }
    end

    if @search_params[:category]
      @vehicles = @vehicles.select { |vehicle| vehicle.category == @search_params[:category] }
    end
    @markers = generate_markers(@vehicles)
  end

  def show
    authorize @vehicle
    @markers = [{ lat: @vehicle.latitude, lng: @vehicle.longitude }]
    @search_params = search_params
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

  # def average(column_name)
  #   calculate(:average, :reviews)
  # end


  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :berths, :address, :price_per_night, :category, :description, :photo)
  end

  def search_params
    search_params = {}

    if params[:location] == "" || params[:location].nil? then search_params[:location] = nil
    else search_params[:location] = params[:location]
    end

    if params[:start_date] == "" || params[:start_date].nil? then search_params[:start_date] = nil
    else search_params[:start_date] = params[:start_date]
    end

    if params[:end_date] == "" || params[:end_date].nil? then search_params[:end_date] = nil
    else search_params[:end_date] = params[:end_date]
    end

    if params[:berths] == "" || params[:berths].nil? then search_params[:berths] = nil
    else search_params[:berths] = params[:berths].to_i
    end

    if params[:category] == "" || params[:category].nil? then search_params[:category] = nil
    else search_params[:category] = params[:category]
    end

    if params[:distance] == "" || params[:distance].nil? then search_params[:distance] = nil
    else search_params[:distance] = params[:distance].to_i
    end

    if params[:price_per_night] == "" || params[:price_per_night].nil? then search_params[:price_per_night] = nil
    else search_params[:price_per_night] = params[:price_per_night].to_i
    end

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


