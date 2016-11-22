class ImagesController < ApplicationController
	before_action :authenticate_user!
	before_action :load_imageable, except: :edit
	before_action :find_image, only: [:show, :edit, :update, :destroy]


	def index
		@images = @imageable.images
	end

	def new
		@image = @imageable.images.new
	end	

	def create
		@image = @imageable.images.new(image_params)
		if @image.imageable_type == "Post"
			if @image.save
				flash[:alert] = "POST image saved successfully!"
				redirect_to [@imageable]
			else
				flash[:alert] = "Image not saved!"
				render 'new'
			end
		elsif @image.imageable_type == "Project"
			if @image.save
				if params[:image][:picture].present?
					render :crop
				else 
					redirect_to [@imageable]
				end

			else
				flash[:alert] = "Image not saved!"
				render 'new'
			end	
		end
	end

	def show
		@imageable_path = @image.imageable
	end

	def edit

	end

	def update
		if @image.update(image_params)
			if params[:image][:picture].present?
				render :crop
			else 
				redirect_to [@imageable]
			end

		else
			flash[:alert] = "Image not saved!"
			render 'edit'
		end	
	end

	def destroy
		@image.destroy
		redirect_to @image.imageable
	end

	private

		def image_params
			params.require(:image).permit(:caption, :picture, :picture_original_w, :picture_original_h, :picture_box_w, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h, :picture_aspect)
		end

		def find_image
			@image = Image.find(params[:id])
		end

		def load_imageable
			resource, id = request.path.split('/')[1, 2]
			@imageable = resource.singularize.classify.constantize.find(id)
		end

end
