class PagesController < ApplicationController
  
  def index
  	redirect_to ingredients_path if signed_in?
  end

  def inventory
  end

  def purchase_order
  end
end
