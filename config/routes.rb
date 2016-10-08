Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
	resources :projects, shallow: true do
		resources :posts, shallow: true do
			resources :images
		end
	end

	resources :searches, only: [:index]

	root 'searches#index'

	get 'tags/:tag', to: 'posts#index', as: :tag


end
