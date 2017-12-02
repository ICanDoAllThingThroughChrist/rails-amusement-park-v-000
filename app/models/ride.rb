class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
     if lots_of_tickets && you_are_tall
       update_status
     elsif !lots_of_tickets && you_are_tall
       "Sorry. You do not have enough tickets to ride the #{attraction.name}."
     elsif lots_of_tickets && !you_are_tall
       "Sorry. You are not tall enough to ride the #{attraction.name}."
     else
       "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
     end
   end

   def lots_of_tickets
     self.user.tickets >= self.attraction.tickets
   end

   def you_are_tall
     self.user.height >= self.attraction.min_height
   end

  def update_status
    user.tickets = user.tickets.to_i - attraction.tickets.to_i
    user.nausea = user.nausea.to_i + attraction.nausea_rating.to_i
    user.happiness = user.happiness.to_i + attraction.happiness_rating.to_i
    user.save
    #binding.pry
  end


end
