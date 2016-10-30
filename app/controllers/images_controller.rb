class ImagesController < ApplicationController
	before_action :authenticate_user!
	before_action :load_imageable
	before_action :find_image, only: [:show, :edit, :update, :destroy]


	def index
		@images = @imageable.images
	end

	def new
		@image = @imageable.images.new
	end	

	def create
		@image = @imageable.images.new(image_params)

		if @image.save
			flash[:alert] = "Image saved successfully!"
			redirect_to [@imageable, :images]
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
	end

	private

		def image_params
			params.require(:image).permit(:caption, :picture)
		end

		def find_image
			@image = Image.find(params[:id])
		end

		def load_imageable
			resource, id = request.path.split('/')[1, 2]
			@imageable = resource.singularize.classify.constantize.find(id)
		end

end
