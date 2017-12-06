class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new #for form partial to pass in instance variable
    raise params.inspect
  end

  def create
    #raise params.inspect
    @user = User.create(user_params)
      if @user && @user.save
      #raise params.inspect
      session[:user_id] = @user.id
      redirect_to user_path(@user)#1
      else
        flash[:alert] = user.errors.full_messages.join(", ")
        render 'users/new'
      end
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user != @user
  end

  def update
    @user = User.find_by(user_params)
    #raise params.inspect
		ride = Ride.new(user: @user, attraction: Attraction.find(params[:user][:attraction]))
    #binding.pry
    #raise params.inspect
		ride.take_ride
    #raise params.inspect
    #binding.pry
		redirect_to user_path(@user)
	end

  private
  def user_params
     params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin )
  end
end
end

#1-https://learn.co/tracks/full-stack-web-development-v3/rails/crud-with-rails/create-action
