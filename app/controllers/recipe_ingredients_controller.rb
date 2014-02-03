class RecipeIngredientsController < ApplicationController

  def edit
    @ingredient = RecipeIngredient.find(params[:id])
    id = @ingredient.recipe.id
    @recipe = Recipe.find(id)
  end

  def create
    @ingredient = RecipeIngredient.new(params[:recipe_ingredient])

    if @ingredient.save
      flash[:success] = "Ingredient was successfully added."
      redirect_to request.referrer
    else
      render action: "new"
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
end
