class PlatesController < ApplicationController

  def index
    @plates = Plate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plates }
    end
  end

  def show
    @plate = Plate.find(params[:id])
    @plate_component = PlateComponent.new 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plate }
    end
  end

  # GET /plates/new
  # GET /plates/new.json
  def new
    @plate = Plate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plate }
    end
  end

  # GET /plates/1/edit
  def edit
    @plate = Plate.find(params[:id])
  end

  # POST /plates
  # POST /plates.json
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
