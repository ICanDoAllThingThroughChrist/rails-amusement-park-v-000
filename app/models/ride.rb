class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if enough_tickets && tall_enough
      #binding.pry
      update_status
      #binding.pry
      #raise params.inspect
    elsif !enough_tickets && tall_enough
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      #binding.pry
    elsif enough_tickets && !tall_enough
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
      #binding.pry
    else
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      #binding.pry
    end
  end

  def enough_tickets
      self.user.tickets >= self.attraction.tickets
  end

  def tall_enough
      self.user.height >= self.attraction.min_height
  end

  def update_status
    user.tickets = self.user.tickets.to_i-self.attraction.tickets.to_i
    #user.save
    #raise params.inspect
    #binding.pry
    user.nausea = self.user.nausea.to_i + self.attraction.nausea_rating.to_i
    user.happiness = self.user.happiness.to_i + self.attraction.happiness_rating.to_i
    user.save
    #binding.pry
    return "Thanks for riding the #{self.attraction.name}!"
    #binding.pry
  end


end
