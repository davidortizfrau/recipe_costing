class PlateCategoriesController < ApplicationController

  def index
    @plate_categories = current_user.plate_categories
    @plate_category = PlateCategory.new
  end

  def edit
    @plate_category = PlateCategory.find(params[:id])
  end

  def create
    @plate_category = current_user.plate_categories.build(params[:plate_category])

    if @plate_category.save
      flash[:success] = 'Category was successfully added.'
      redirect_to plate_categories_path
    else
      redirect_to plate_categories_path
    end
  end

  def update
    @plate_category = PlateCategory.find(params[:id])

    if @plate_category.update_attributes(params[:plate_category])
      flash[:success] = 'Category was successfully updated.'
      redirect_to plate_categories_path
    else
      redirect_to plate_categories_path
    end
  end

  def destroy
    @plate_category = PlateCategory.find(params[:id]).destroy
    redirect_to plate_categories_path
  end
end
