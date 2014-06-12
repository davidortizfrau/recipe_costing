class RecipeComponentsController < ApplicationController
  
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def edit
    @recipe_component = RecipeComponent.find(params[:id])
    @recipe = @recipe_component.recipe
    @recipes = current_user.recipes.to_a - [@recipe]
  end

  def create
    @recipe_component = RecipeComponent.new(params[:recipe_component])

    if @recipe_component.save
      flash[:success] = 'Recipe component was successfully added.'
      redirect_to @recipe_component.recipe 
    else
      redirect_to @recipe_component.recipe 
    end
  end

  def update
    @recipe_component = RecipeComponent.find(params[:id])

    if @recipe_component.update_attributes(params[:recipe_component])
      flash[:success] = 'Recipe component was successfully updated.'
      redirect_to @recipe_component.recipe 
    else
      render action: "edit"
    end
  end

  def destroy
    @recipe_component = RecipeComponent.find(params[:id]).destroy
    redirect_to @recipe_component.recipe 
  end

private

  def correct_user
    @recipe_component = RecipeComponent.find(params[:id])
    redirect_to root_path unless current_user?(@recipe_component.recipe.user)
  end
end