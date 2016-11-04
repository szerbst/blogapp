class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy, :edit_picture]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at DESC")
	end

	def show
		@posts = Post.all.order("created_at DESC").paginate(:page => params[:post_page], :per_page => 5)
		@images = @project.post_images + @project.images
		@comments = @project.comments 
	end

	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)
		if @project.save
			if params[:project][:picture].present?
				render :crop
			else 
				redirect_to root_path
			end
		else
			render 'new'
		end	
	end

	def edit
		
	end

	def edit_picture
		
	end
	
	def update
		if @project.update(project_params)
			if params[:project][:picture].present?
				render :crop
			else 
				redirect_to root_path
			end
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end
	
	private

		def project_params
			params.require(:project).permit(:title, :description, :picture, :year, :make, :model, :project_type, :picture_original_w, :picture_original_h, :picture_box_w, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h, :picture_aspect)

		end

		def find_project
			@project = Project.find(params[:id])
		end


end
