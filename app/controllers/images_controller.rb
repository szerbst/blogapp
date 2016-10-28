class ImagesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_image, only: [:show, :edit, :update, :destroy]


	def new
		@post = Post.find(params[:post_id])
	end	

	def create
		@post = Post.find(params[:post_id]) 
		@image = @post.images.new(image_params)
		@image.project_id = @post.project_id
		@image.user_id = current_user.id
		@image.save!

		if @image.save
			flash[:alert] = "Image saved successfully!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Image not saved!"
			render 'new'
		end
	end

	def show
	
	end

	def edit

	end

	def update
		if @image.update(image_params)
			redirect_to image_path(@image)
		else
			render 'edit'
		end
	end

	def destroy
		@image.destroy
		redirect_to post_path(@image.post_id)
	end

	private

		def image_params
			params.require(:image).permit(:caption, :picture)
		end

		def find_image
			@image = Image.find(params[:id])
		end


end
