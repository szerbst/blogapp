class SearchesController < ApplicationController

	def index
		if params[:search].blank?
			@search_project = nil
			@search_post = nil
		else
			@search_project = Sunspot.search [Project] do
			fulltext params[:search]
			end
			@search_post = Sunspot.search [Post] do
			fulltext params[:search]
			end
			@results_project = @search_project.results
			@results_post = @search_post.results
		end
	end
	
end
