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
      format.html { redirect_to @plate_ingredient.plate }
      format.json { render json: @plate_ingredient, status: :created, location: @plate_ingredient }
    else
      format.html { render action: "new" }
      format.json { render json: @plate_ingredient.errors, status: :unprocessable_entity }
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

    respond_to do |format|
      format.html { redirect_to plate_ingredients_url }
      format.json { head :no_content }
    end
  end
end
