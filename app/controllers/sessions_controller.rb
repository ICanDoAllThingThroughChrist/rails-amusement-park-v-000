class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      #binding.pry
      redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      render 'new'
    end
  end
end
