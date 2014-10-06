class RepliesController < ApplicationController

	def index
		@replies = Reply.all
	end

	def show
		@reply = Reply.find(params[:id])
	end

	def new
		@topic = Topic.find(params[:topic_id])
		@reply = Reply.new
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@reply = @topic.replies.new(reply_params)
		if @reply.save
			flash[:notice] = 'Reply posted.'
			redirect_to topic_path(@topic.id)
		else
			flash[:alert] = 'Reply not successful.'
		end
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		@reply = Reply.find(params[:id])
		@topic = @reply.topic
		if @reply.delete
			flash[:notice] = 'Reply successfully deleted.'
			redirect_to topic_path(@topic.id)
		else
			flash[:alert] = 'Reply was not deleted.'
		end
	end

	def reply_params
		params.require(:reply).permit(:body, :user_id, :topic_id)
		
	end
end
