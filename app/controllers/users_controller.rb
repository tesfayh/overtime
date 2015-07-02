class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/newot', notice: "thank you for signing up for LIBOT and now you can add your OT"
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
