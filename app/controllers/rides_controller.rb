class RidesController < ApplicationController
  before_action :require_user

  def index
    @week_stats = current_user.rides.current_week_stats
    @month_stats = current_user.rides.current_month_stats
  end

  def new
    @ride = current_user.rides.new
    @taxi_providers = Taxi.all
  end

  def create
    @ride = current_user.rides.new(ride_params)
    if @ride.save
      redirect_to rides_path
    else
      @taxi_providers = Taxi.all
      flash.now[:danger] = @ride.errors.full_messages.to_sentence
      render 'new', status: :not_acceptable
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:origin, :destination, :price, :taxi_id)
  end
end
