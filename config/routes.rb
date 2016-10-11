Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
	resources :projects, shallow: true do
		resources :posts, shallow: true do
			resources :images
		end
	end

	resources :searches, only: [:index]

	root 'main#index'

	get 'tags/:tag', to: 'posts#index', as: :tag

	get 'projects/:id/edit_picture', to: 'projects#edit_picture', as: :edit_picture




end
