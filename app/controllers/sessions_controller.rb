class SessionsController < ApplicationController


	def create
  		user = User.find_by_username(params[:username]) || User.find_by_email(params[:email])

  	if user and user.authenticate(params[:password])
  			session[:user_id] = user.id
        
  			redirect_to '/newot', notice: "Logged In!"
  	else
  			flash[:error] = "wrong username or password."
  		  	redirect_to root_url
   	    end
      end

    def destroy
   		session[:user_id] = nil
  		  redirect_to root_url, notice: "Logged Out!"
      end
   end
