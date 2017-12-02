class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
      if self.not_enough_tickets && self.not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      else
        update_status
      end
  end

  def not_enough_tickets
    if attraction.tickets.to_i > user.tickets.to_i#not enogh tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
  end

  def not_tall_enough
    if user.height.to_i < attraction.min_height.to_i#not tall enough
    "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def update_status
    user.tickets = user.tickets.to_i - attraction.tickets.to_i
    user.nausea = user.nausea.to_i - attraction.nausea_rating.to_i
    user.happiness = user.happiness.to_i - attraction.happiness_rating.to_i
    user.save
  end


end
