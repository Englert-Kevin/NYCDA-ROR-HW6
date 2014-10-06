class SessionsController < ApplicationController

	def new

	end

	def create
		@user = User.where(username: params[:username]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:notice] = 'Login successful!'
			redirect_to users_path
		else
			flash[:alert] = 'Login failed.'
			redirect_to users_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to users_path
	end

end
