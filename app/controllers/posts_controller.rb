class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		if params[:tag]
  			@posts = Post.tagged_with(params[:tag])
		else
			@posts = Post.all.order("created_at DESC")
		end
	end

	def new
		@project = Project.find(params[:project_id])
		@post = @project.posts.build
	end	

	def create
		@project = Project.find(params[:project_id])
		@post = @project.posts.build(post_params)
		@post.user_id = current_user.id

		if @post.save
			flash[:alert] = "Post added successfully!"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def show

	end

	def edit
		@project = @post.project_id
	end

	def update
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to project_path(@post.project_id)
	end

	private

		def post_params
			params.require(:post).permit(:title, :content, :tag_list)
		end

		def find_post
			@post = Post.find(params[:id])
		end


end
