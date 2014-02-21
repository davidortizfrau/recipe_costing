class PlateIngredientsController < ApplicationController

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
    @plate_ingredient = PlateIngredient.find(params[:id])
    @plate_ingredient.destroy

    redirect_to @plate_ingredient.plate
  end
end
