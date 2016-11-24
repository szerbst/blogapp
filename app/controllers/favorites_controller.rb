class FavoritesController < ApplicationController
	before_action :authenticate_user!
	before_action :load_favorable, except: :destroy
	
	def create
		@favorite = @favorable.favorites.new
		@favorite.user_id = current_user.id

		if @favorite.save
			redirect_to @favorable
		else
			redirect
		end
	end

	def destroy
		@favorite = Favorite.where(:user_id => current_user.id).where(:favorable_id => params[:id])
		@favorite.destroy_all
		session[:return_to] ||= request.referer
		redirect_to session.delete(:return_to)
	end

	private

		def favorite_params
			params.require().permit()
		end

		def find_favorite
			@favorite = Favorite.where(:user_id => current_user.id)

		end

		def load_favorable
			resource, id = request.path.split('/')[1, 2]
			@favorable = resource.singularize.classify.constantize.find(id)
		end


end
