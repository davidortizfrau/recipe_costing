class RecipeIngredientsController < ApplicationController

  before_filter :correct_user, only: [:edit, :update, :destroy]

  def edit
    @ingredient = RecipeIngredient.find(params[:id])
    @recipe = @ingredient.recipe
    @ingredients = current_user.ingredients
  end

  def create
    @ingredient = RecipeIngredient.new(params[:recipe_ingredient])

    if @ingredient.save
      flash[:success] = "Ingredient was successfully added."
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def update
    @ingredient = RecipeIngredient.find(params[:id])

    if @ingredient.update_attributes(params[:recipe_ingredient])
      flash[:success] = "Ingredient was successfully updated."
      redirect_to recipe_path(@ingredient.recipe)
    else
      render action: "edit"
    end
  end

  def destroy
    @ingredient = RecipeIngredient.find(params[:id]).destroy
    redirect_to request.referrer
  end

private

  def correct_user
    @ingredient = RecipeIngredient.find(params[:id])
    redirect_to root_path unless current_user?(@ingredient.ingredient.user)
  end
end
