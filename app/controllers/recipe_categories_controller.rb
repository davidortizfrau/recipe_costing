class RecipeCategoriesController < ApplicationController

  def index
    @recipe_categories = current_user.recipe_categories
    @recipe_category = RecipeCategory.new
  end

  def edit
    @recipe_category = RecipeCategory.find(params[:id])
  end

  def create
    @recipe_category = current_user.recipe_categories.build(params[:recipe_category])

      if @recipe_category.save
        flash[:success] = 'Recipe category was successfully created.'
        redirect_to new_recipe_path
      else
        render action: "index"
      end
  end

  def update
    @recipe_category = RecipeCategory.find(params[:id])

    if @recipe_category.update_attributes(params[:recipe_category])
      flash[:success] = 'Category was successfully updated.'
      redirect_to recipe_categories_path
    else
      format.html { render action: "edit" }
    end
  end

  def destroy
    @recipe_category = RecipeCategory.find(params[:id]).destroy
    redirect_to recipe_categories_url
  end
end
