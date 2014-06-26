class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to ingredients_path
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def demo
		flash[:success] = "Go ahead and sign in with our demo user. Feel free to play around and create a few recipes."
		render 'new'
	end
	
	def destroy
		sign_out
		redirect_to root_url
	end
end
