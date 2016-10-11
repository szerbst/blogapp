class MainController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at DESC")
		@posts = Post.all.order("created_at DESC")
	end



end
