class UsersController < ApplicationController
  http_basic_authenticate_with name:     ENV["ADMIN_USER"], 
                               password: ENV["ADMIN_PASS"],
                               only: :index
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      Ingredient.categories.each do |category|
        c = @user.ingredient_categories.build(name: category.humanize)
        c.save
      end

      Recipe.categories.each do |category|
        c = @user.recipe_categories.build(name: category.humanize)
        c.save
      end

      Plate.categories.each do |category|
        c = @user.plate_categories.build(name: category.humanize)
        c.save
      end

      sign_in @user
      flash[:success] = "Welcome #{@user.name}! Now add your first ingredient. Is very easy!"
      redirect_to new_ingredient_path
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = 'Account was successfully updated.'
      redirect_to edit_user_path(@user)
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to root_path
  end
end
