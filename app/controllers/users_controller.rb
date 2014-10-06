class UsersController < ApplicationController
	
	def index
		@user = User.find(session[:user_id]) if session[:user_id]
	end

	def show
		@user = User.find(session[:user_id]) if session[:user_id]
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'New user successfully created.'
			session[:user_id] = @user.id
			redirect_to users_path
		else
			flash[:alert] = 'We could not sign you up. Try again.'
			redirect_to new_user_path
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@reply = Reply.find(params[:id])
		if @reply.delete
			flash[:notice] = 'Reply successfully deleted.'
		else
			flash[:alert] = 'Reply was not deleted.'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :email)
	end
end
