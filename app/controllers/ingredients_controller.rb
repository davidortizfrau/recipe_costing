class IngredientsController < ApplicationController

  def index
    @ingredients = current_user.ingredients
    @categories = Ingredient.categories
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])

    @ingredient.name = params[:ingredient][:name].titleize

    if @ingredient.save
      flash[:success] = @ingredient.name + " was successfully created."
      redirect_to ingredients_path
    else
      render action: "new"
    end
    
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update_attributes(params[:ingredient])
      flash[:success] = @ingredient.name + " has been successfully updated!"
      redirect_to ingredients_path
    else
      render action: "edit"
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id]).destroy
    redirect_to ingredients_url
  end
end
