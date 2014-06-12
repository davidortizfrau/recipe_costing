class PlatesController < ApplicationController
  before_filter :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to new_plate_path unless current_user.plates.any?
    @plates = current_user.plates
  end

  def show
    @plate = Plate.find(params[:id])
    @plate_component = PlateComponent.new 
    @plate_ingredient = PlateIngredient.new
    @recipes = current_user.recipes
  end

  def new
    @plate = Plate.new
  end

  def edit
    @plate = Plate.find(params[:id])
  end

  def create
    @plate = Plate.new(params[:plate])

    if @plate.save
      flash[:success] = "Plate was successfully created."
      redirect_to @plate
    else
      render action: "new"
    end
  end

  def update
    @plate = Plate.find(params[:id])

    if @plate.update_attributes(params[:plate])
      flash[:success] = "#{@plate.name} was successfully updated"
      redirect_to @plate
    else
      render action: "edit"
    end
  end

  def destroy
    @plate = Plate.find(params[:id]).destroy
    redirect_to plates_url
  end

private

  def correct_user
    @plate = Plate.find(params[:id])
    redirect_to plates_url unless current_user?(@plate.user)
  end
end
