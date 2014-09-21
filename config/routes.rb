Rails.application.routes.draw do

  devise_for :users

  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      resource :session, only: [:create, :destroy]
    end
    resources :monument_groups, only: [:index, :create, :update, :destroy, :show] do
      resources :monuments, only: [:index, :create, :update, :destroy]
    end
  end

  root :to => "home#index"

  get '/dashboard' => 'templates#index'
  get '/monument_groups/:id' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }

end
