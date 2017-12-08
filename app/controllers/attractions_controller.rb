class AttractionsController < ApplicationController

  before_action :set_attraction, only: [:show, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :destroy]

  def index
    @attractions = Attraction.all
  end

  def edit
  end

  def show
    #@user = current_user
    @user = current_user
    #raise params.inspect
  end

  def create
    @attraction = Attraction.new(attraction_params)
    #raise params.inspect
    if @attraction.save
      #aise params.inspect
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = user.errors.full_messages.join(", ")
      redirect_to new_attraction_path
    end
  end

  def update
		if @attraction.update(attraction_params)
			redirect_to attraction_path(@attraction)
		else
			redirect_to edit_attraction_path
		end
	end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

   def require_admin
     redirect_to attraction_path(@attraction) unless current_user.admin
   end

end
