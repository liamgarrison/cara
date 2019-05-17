class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search_term = params[:q]
    if @search_term.nil?
      if params[:user_id]
        @vehicles = policy_scope(Vehicle).where(owner_id: params[:user_id])
      else
        @vehicles = policy_scope(Vehicle).all
      end
    else
      regex = Regexp.new(@search_term, "i")
      @vehicles = policy_scope(Vehicle).select { |vehicle| vehicle.address.match(regex) }
      # @vehicles = Vehicle.where.not(latitude: nil, longitude: nil)
      @vehicles = Vehicle.near(@search_term, 20)
      @markers = @vehicles.map do |vehicle|
      {
        lat: vehicle.latitude,
        lng: vehicle.longitude
      }
      end
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

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

end
