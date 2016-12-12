class ResponsesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@response = @post.responses.create(params[:response].permit(:document, :delete_document, :comment, :user_id, :name))
		@response.user_id = current_user.id if current_user
		@response.save
		if @response.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
	def edit 
		@post = Post.find(params[:post_id])
		@response = @post.responses.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@response = @post.responses.find(params[:id])
		if @response.update(params[:response].permit(:comment, :user_id, :name, :delete_document, :document))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@response = @post.responses.find(params[:id])
		@response.destroy
		redirect_to post_path(@post)
	end

end


