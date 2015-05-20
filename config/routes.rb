require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
    get '/login' => 'devise/sessions#new'
    get '/register' => 'devise/registrations#new'
    get '/account_update' => 'devise/registrations#edit'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do

      # api/v1/movies
      get 'movies' => 'pages#movies'

      # api/v1/tv-series
      get 'tv-series' => 'pages#series'

      #api/v1/movies/movie-title
      get 'movies/:id' => 'pages#show'

      #api/v1/tv-series/series-title
      get 'tv-series/:id' => 'pages#view'

    end
  end

  resources :posts
  resources :genres, except: [:show, :edit, :post]
  resources :siri_genres, except: [:show, :edit, :post]
  resources :users, except: [:show, :edit, :post, :destroy, :new, :create] do
    member do
      patch :revoke
      patch :grant
    end
  end
  resources :siris do
    resources :seasons, except: [:show] do
      resources :episodes
    end
  end

  get '/dashboard' => 'dashboards#index'

  get 'movies/:sort/:id' => 'pages#show', as: 'genre_show'

  get 'tv-series/:view/:id' => 'pages#view', as: 'siri_genre_show'
  get '/tv-series/:view/:siri_id/:season_id-:id' => 'pages#ep', as: 'watch_ep'

  scope :q do 
    get 'search' => 'pages#search', as: :search
  end

  get 'movies' => 'pages#movies'
  get 'movies/:sort/' => 'pages#movies', as: 'genre_index'
  get 'tv-series' => 'pages#series'
  get 'tv-series/:view/' => 'pages#series', as: 'siri_genre_index'

  # You can have the root of your site routed with "root"
  root 'pages#index'

  mount Sidekiq::Web, at: '/sidekiq'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
