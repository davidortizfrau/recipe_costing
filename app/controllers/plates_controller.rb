class PlatesController < ApplicationController

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

    respond_to do |format|
      if @plate.save
        flash[:success] = "Plate was successfully created."
        format.html { redirect_to @plate }
        format.json { render json: @plate, status: :created, location: @plate }
      else
        format.html { render action: "new" }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plates/1
  # PUT /plates/1.json
  def update
    @plate = Plate.find(params[:id])

    respond_to do |format|
      if @plate.update_attributes(params[:plate])
        format.html { redirect_to @plate, notice: 'Plate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    @plate = Plate.find(params[:id])
    @plate.destroy

    respond_to do |format|
      format.html { redirect_to plates_url }
      format.json { head :no_content }
    end
  end
end
