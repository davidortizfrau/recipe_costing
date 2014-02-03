class PlateComponentsController < ApplicationController

  def edit
    @plate_component = PlateComponent.find(params[:id])
    id = @plate_component.plate.id
    @plate = Plate.find(id)
  end

  def create
    @plate_component = PlateComponent.new(params[:plate_component])

    respond_to do |format|
      if @plate_component.save
        flash[:success] = "#{@plate_component.recipe.name} was added succesfully."
        format.html { redirect_to @plate_component.plate }
        format.json { render json: @plate_component, status: :created, location: @plate_component }
      else
        format.html { render action: "new" }
        format.json { render json: @plate_component.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @plate_component = PlateComponent.find(params[:id])

    respond_to do |format|
      if @plate_component.update_attributes(params[:plate_component])
        format.html { redirect_to @plate_component.plate, notice: 'Plate component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plate_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plate_components/1
  # DELETE /plate_components/1.json
  def destroy
    @plate_component = PlateComponent.find(params[:id]).destroy

    redirect_to @plate_component.plate
  end
end
