class IngredientCategoriesController < ApplicationController

  def index
    @ingredient_categories = current_user.ingredient_categories
    @ingredient_category = IngredientCategory.new
  end

  def edit
    @ingredient_category = IngredientCategory.find(params[:id])
  end

  def create
    @ingredient_category = current_user.ingredient_categories.build(params[:ingredient_category])

    if @ingredient_category.save
      flash[:success] = 'Category was added successfully.'
      redirect_to new_ingredient_path
    else
      redirect_to ingredient_categories_path
    end
  end

  def update
    @ingredient_category = IngredientCategory.find(params[:id])

    if @ingredient_category.update_attributes(params[:ingredient_category])
      flash[:success] = 'Category was successfully updated.'
      redirect_to ingredient_categories_path
    else
      render action: "edit"
    end
  end

  def destroy
    @ingredient_category = IngredientCategory.find(params[:id]).destroy
    redirect_to ingredient_categories_url
  end
end
