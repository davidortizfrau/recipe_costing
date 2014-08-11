class RecipesController < ApplicationController
  
  before_filter :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to new_recipe_path unless current_user.recipes.any?
    @recipes = current_user.recipes.includes(ingredients: :ingredient).all
    @categories = current_user.recipe_categories
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = current_user.ingredients
    @ingredient = RecipeIngredient.new
    @recipe_component = RecipeComponent.new
    @recipes = current_user.recipes.to_a - [@recipe]
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = current_user.recipes.build(params[:recipe])

    if @recipe.save
      flash[:success] = @recipe.name + ' Recipe was successfully created.'
      redirect_to @recipe
    else
      render action: "new"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        flash[:success] = @recipe.name + ' Recipe was successfully updated.'
        format.html { redirect_to @recipe }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @recipe = Recipe.find(params[:id]).destroy
    redirect_to recipes_url
  end

private

  def correct_user
    @recipe = Recipe.find(params[:id])
    redirect_to root_path unless current_user?(@recipe.user)
  end
end
