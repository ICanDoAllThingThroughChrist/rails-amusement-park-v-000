class RidesController < ApplicationController

  def create
    ride = Ride.create(ride_params)
    message = ride.take_ride
    redirect_to user_path(ride.user), flash: {notice: message}
  end

private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end

end
