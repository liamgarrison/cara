class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @search_term = params[:q]
    if @search_term.nil?
      @vehicles = Vehicle.all
    else
      regex = Regexp.new(@search_term, "i")
      @vehicles = Vehicle.select { |vehicle| vehicle.address.match(regex) }
    end
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
    @user = User.find(params[:user_id])
  end

  def edit
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.owner = User.find(params[:user_id])
    authorize @vehicle
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle)
    else
      render :edit
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :berths, :address, :price_per_night, :category, :description)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
