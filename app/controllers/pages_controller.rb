class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized
  def home
    @vehicles = []
    all_vehicles = Vehicle.all
    3.times{ @vehicles << all_vehicles.sample }
  end
end
