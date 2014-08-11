class IngredientsController < ApplicationController
  before_filter :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    if signed_in?
      redirect_to new_ingredient_path unless current_user.ingredients.any?
      @ingredients = current_user.ingredients
      @categories = current_user.ingredient_categories
      @total_inventory = 0
      @ingredients.each do |i|
        @total_inventory += i.inventory_cost if i.inventory_cost
      end
    else
      redirect_to root_path
    end
  end

  def new
    @ingredient = Ingredient.new

    if params[:category]
      @ingredient.ingredient_category_id = params[:category]
    end
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

  def edit_prices
    if signed_in?
      @ingredients = current_user.ingredients
      @categories = current_user.ingredient_categories
    else
      redirect_to root_path
    end
  end

  def update_prices
    @ingredients = Ingredient.update(params[:ingredients].keys, params[:ingredients].values)
    flash[:success] = "Prices Updated successfully"
    render "edit_prices"
  end

  def edit_inventory
    if signed_in?
      @ingredients = current_user.ingredients
      @categories = current_user.ingredient_categories
    else
      redirect_to root_path
    end
  end

  def update_inventory

  end

private

  def correct_user
    @ingredient = Ingredient.find(params[:id])
    redirect_to root_path unless current_user?(@ingredient.user)
  end
end
