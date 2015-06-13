class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "thank you for signing up for LIBOT!"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def user_params
	params.require(:user).permit(:email, :username, :name, :password, :password_confirmation)
	end
end
