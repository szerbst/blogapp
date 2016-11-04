class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :load_commentable
	before_action :find_comment, only: [:show, :edit, :update, :destroy]

	def index
		@comments = @commentable.images
	end

	def new
		@comment = @commentable.comments.new
	end	

	def create
		@comment = @commentable.comments.new(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to [@commentable, :comments]
		else
			render 'new'
		end
	end

	def show
	
	end

	def edit

	end

	def update
		if @comment.update(comment_params)
			redirect_to comment_path(@comment)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
	end

	private

		def comment_params
			params.require(:comment).permit(:comment)
		end

		def find_image
			@comment = Comment.find(params[:id])
		end

		def load_commentable
			resource, id = request.path.split('/')[1, 2]
			@commentable = resource.singularize.classify.constantize.find(id)
		end

end
