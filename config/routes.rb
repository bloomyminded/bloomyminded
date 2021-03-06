Rails.application.routes.draw do
  root "cheeses#index"

  devise_for :users, :skip => [:sessions], :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"  }

	devise_scope :user do
		get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
		get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	end

  get '/about', to: 'about#index'

  resources :cheeses do
    match 'add_tag' => 'cheeses#add_to_tags', via: :post
  end
end
