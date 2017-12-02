class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user
  def take_ride
    if attraction.tickets.to_i > user.tickets.to_i
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
  end
end
