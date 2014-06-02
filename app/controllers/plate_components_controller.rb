class PlateComponentsController < ApplicationController

  def edit
    @plate_component = PlateComponent.find(params[:id])
    id = @plate_component.plate.id
    @plate = Plate.find(id)
    @recipes = current_user.recipes
  end

  def create
    @plate_component = PlateComponent.new(params[:plate_component])

    if @plate_component.save
      flash[:success] = "#{@plate_component.recipe.name} was added succesfully."
      redirect_to @plate_component.plate
    else
      redirect_to request.referer
    end

  end

  def update
    @plate_component = PlateComponent.find(params[:id])


      if @plate_component.update_attributes(params[:plate_component])
        flash[:success] = 'Plate component was successfully updated.'
        redirect_to @plate_component.plate
      else
        redirect_to request.referer
      end

  end

  # DELETE /plate_components/1
  # DELETE /plate_components/1.json
  def destroy
    @plate_component = PlateComponent.find(params[:id]).destroy

    redirect_to @plate_component.plate
  end
end
