class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise params.inspect
    @user = User.new(user_params)
  end

  def user_params
     params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin )
  end
end
