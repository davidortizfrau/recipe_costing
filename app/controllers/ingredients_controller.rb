class IngredientsController < ApplicationController
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    redirect_to new_ingredient_path unless current_user.ingredients.any?
    @ingredients = current_user.ingredients
    @categories = current_user.ingredient_categories
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = current_user.ingredients.build(params[:ingredient])

    @ingredient.name = params[:ingredient][:name].titleize

    if @ingredient.save
      flash[:success] = @ingredient.name + " was successfully added to ingredients."
      redirect_to ingredients_path
    else
      render action: "new"
    end
    
  end

  def update
    if @ingredient.update_attributes(params[:ingredient])
      flash[:success] = @ingredient.name + " has been successfully updated!"
      redirect_to ingredients_path
    else
      render action: "edit"
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url
  end

private

  def correct_user
    @ingredient = Ingredient.find(params[:id])
    redirect_to root_path unless current_user?(@ingredient.user)
  end
end
