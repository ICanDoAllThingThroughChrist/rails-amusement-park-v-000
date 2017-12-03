class UsersController < ApplicationController
  def new
    @user = User.new
    #raise params.inspect
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
    redirect_to root_path unless session[:user_id]
      @user = User.find_by(id: params[:id])
  end

  private
  def user_params
     params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin )
  end
end

#1-https://learn.co/tracks/full-stack-web-development-v3/rails/crud-with-rails/create-action
