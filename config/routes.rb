Rails.application.routes.draw do
  root 'welcome#index'

  get '/about', to: 'about#show'

  get '/info', to: 'info#show'

  get '/alerts', to: 'alerts#index'


  get '/search', to: 'search#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
  get '/auth/google/callback', to: 'sessions#create'

  get '/auth/google', as: 'google_login'

  namespace :host_shelters do
    get '/sign_up', to: 'properties#new'
    resources :properties, only: [:create, :new, :index] do
      post "status_accepted", :action => :status_accepted
      post "status_cancelled", :action => :status_cancelled
      post "status_complete", :action => :status_complete
      resources :reservations, only: [:index]
      resources :directions, only: [:index]
    end
    get '/:id', to: 'properties#show'
  end

  resources :users, only: [:new, :create] do
    resources :properties, only: [:index]
  end

  resources :contact_forms, only: [:new, :create]

end
