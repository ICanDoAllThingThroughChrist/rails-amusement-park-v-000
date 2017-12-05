class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if enough_tickets && tall_enough
      update_status
      #binding.pry
      #raise params.inspect
    elsif !enough_tickets && tall_enough
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
       "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def enough_tickets
      self.user.tickets >= self.attraction.tickets
  end

  def tall_enough
      self.user.height >= self.attraction.min_height
  end

  def update_status
    user.tickets = user.tickets.to_i - attraction.tickets.to_i
    # raise params.inspect
    user.nausea = user.nausea.to_i + attraction.nausea_rating.to_i
    user.happiness = user.happiness.to_i + attraction.happiness_rating.to_i
    user.save
        "Thanks for riding the #{self.attraction.name}!"
    #binding.pry
  end


end
