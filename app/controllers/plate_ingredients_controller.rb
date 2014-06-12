class PlateIngredientsController < ApplicationController

  before_filter :correct_user, only: [:edit, :update, :destroy]

  def edit
    @plate_ingredient = PlateIngredient.find(params[:id])
    id = @plate_ingredient.plate.id
    @plate = Plate.find(id)
  end

  def create
    @plate_ingredient = PlateIngredient.new(params[:plate_ingredient])

    
    if @plate_ingredient.save
      flash[:success] = "Plate ingredient was successfully created.'"
      redirect_to @plate_ingredient.plate
    else
      redirect_to @plate_ingredient.plate
    end
    
  end

  def update
    @plate_ingredient = PlateIngredient.find(params[:id])

    if @plate_ingredient.update_attributes(params[:plate_ingredient])
      flash[:success] = "#{@plate_ingredient.ingredient.name} was successfully updated."
      redirect_to @plate_ingredient.plate
    else
      render action: "edit"
    end
  end

  def destroy
    @plate_ingredient = PlateIngredient.find(params[:id]).destroy
    redirect_to @plate_ingredient.plate
  end

private

  def correct_user
    @plate_ingredient = PlateIngredient.find(params[:id])
    redirect_to root_path unless current_user?(@plate_ingredient.ingredient.user)
  end
end
