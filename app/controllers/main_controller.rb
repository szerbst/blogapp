class MainController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at DESC").paginate(:page => params[:project_page], :per_page => 3)
		@featured_projects = Project.all.order("created_at DESC")
		@posts = Post.all.order("created_at DESC").paginate(:page => params[:post_page], :per_page => 5)
	end

end
