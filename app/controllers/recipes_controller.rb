class RecipesController < ApplicationController

  def index
    @recipes = Recipe.includes(recipe_ingredients: :ingredient).all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredient = RecipeIngredient.new
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      flash[:success] = @recipe.name + 'Recipe was successfully created.'
      redirect_to @recipe
    else
      render action: "new"
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        flash[:success] = @recipe.name + 'Recipe was successfully updated.'
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
end
