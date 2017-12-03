class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      #redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :new
      # Create an error message
    end
  end
end
