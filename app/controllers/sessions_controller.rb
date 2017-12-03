class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      #redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      redirect_to '/signin'
      # Create an error message
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
