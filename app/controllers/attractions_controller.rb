class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def edit
  end

  def show
    @user = current_user
  end
end
