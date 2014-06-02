require 'spec_helper'

describe Ingredient do
	
	
	it { should respond_to(:name) }
	it { should respond_to(:user) }
	it { should respond_to(:category) }
	it { should respond_to(:price) }
	it { should respond_to(:unit) }
	it { should respond_to(:yield) }

	it "is invalid without a name" do
		ingredient = Ingredient.new
		ingredient.name = " "
		ingredient.should_not be_valid
	end

	it "is invalid without a category" do
		ingredient = Ingredient.new
		ingredient.category = nil
		ingredient.should_not be_valid
	end

	it "is invalid without user_id" do
		ingredient = Ingredient.new
		ingredient.user_id = nil
		ingredient.should_not be_valid
	end

end
