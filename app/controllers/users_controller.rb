class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    @user = User.create(user_params)
    redirect_to user_path(@user)#1
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def user_params
     params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin )
  end
end

#1-https://learn.co/tracks/full-stack-web-development-v3/rails/crud-with-rails/create-action
