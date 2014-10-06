class TopicsController < ApplicationController

	def index
		@topics = Topic.all	
	end

	def show
		@topic = Topic.find(params[:id])
		@replies = @topic.replies.all

	end

	def new
		@user = User.find(session[:user_id])
		@topic = Topic.new()
		
	end

	def create
		@user = User.find(session[:user_id])
		@topic = @user.topics.new(topics_params)
		if @topic.save
			flash[:notice] = 'New Topic Created.'
			redirect_to user_topic_path(@topic.user_id, @topic.id)
		else
			flash[:alert] = 'Topic not created.'
		end
	end

	def edit
		
	end

	def update
		
	end

	private

	def topics_params
		params.require(:topic).permit(:title, :description, :user_id)
	end

end
