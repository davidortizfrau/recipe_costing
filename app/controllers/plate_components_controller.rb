class PlateComponentsController < ApplicationController

  def index
    @plate_components = PlateComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plate_components }
    end
  end

  def show
    @plate_component = PlateComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plate_component }
    end
  end

  # GET /plate_components/new
  # GET /plate_components/new.json
  def new
    @plate_component = PlateComponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plate_component }
    end
  end

  # GET /plate_components/1/edit
  def edit
    @plate_component = PlateComponent.find(params[:id])
  end

  # POST /plate_components
  # POST /plate_components.json
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

  # PUT /plate_components/1
  # PUT /plate_components/1.json
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
