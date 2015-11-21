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

  resources :activities
  resources :posts
  resources :genres, except: [:show, :edit, :post]
  resources :siri_genres, except: [:show, :edit, :post]
  resources :anime_genres, except: [:show, :edit, :post]
  resources :asian_genres, except: [:show, :edit, :post]
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
  resources :animes do
    resources :anime_seasons, except: [:show] do
      resources :anime_episodes
    end
  end
  resources :asians do
    resources :asian_seasons, except: [:show] do
      resources :asian_episodes
    end
  end
  resources :requests, only: [:new, :create, :show] do
    member do
      patch :set_pending
      patch :set_approved
      patch :set_rejected
      patch :set_closed
    end
  end
  resources :reports, only: [:new, :create, :show] do
    member do
      patch :mark_pending
      patch :mark_solved
    end
  end
  resources :bookmarks, only: [:create, :destroy]

  get '/dashboard' => 'dashboards#index'

  get 'movies/:sort/:id' => 'pages#show', as: 'genre_show'
  get 'tv-series/:view/:id' => 'pages#view', as: 'siri_genre_show'
  get '/tv-series/:view/:siri_id/:season_id-:id' => 'pages#ep', as: 'watch_ep'
  get 'anime-series/:anime_view/:id' => 'pages#anime_view', as: 'anime_genre_show'
  get '/anime-series/:anime_view/:anime_id/:anime_season_id-:id' => 'pages#anime_ep', as: 'watch_anime_ep'
  get 'asian-drama/:asian_view/:id' => 'pages#asian_view', as: 'asian_genre_show'
  get '/asian-drama/:asian_view/:asian_id/:asian_season_id-:id' => 'pages#asian_ep', as: 'watch_asian_ep'

  get '/developer' => 'pages#developer'
  get '/dmca' => 'pages#dmca'

  scope :q do
    get 'search' => 'pages#search', as: :search
  end

  get 'movies' => 'pages#movies'
  get 'movies/:sort/' => 'pages#movies', as: 'genre_index'
  get 'tv-series' => 'pages#series'
  get 'tv-series/:view/' => 'pages#series', as: 'siri_genre_index'
  get 'anime-series' => 'pages#anime_series'
  get 'anime-series/:anime_view/' => 'pages#anime_series', as: 'anime_genre_index'
  get 'asian-drama' => 'pages#asian_series'
  get 'asian-drama/:asian_view/' => 'pages#asian_series', as: 'asian_genre_index'

  #pagination
  get 'movies/all/page/:page' => 'pages#movies'
  get 'movies/:sort/page/:page' => 'pages#movies'
  get 'tv-series/all/page/:page' => 'pages#series'
  get 'tv-series/:view/page/:page' => 'pages#series'
  get 'anime-series/all/page/:page' => 'pages#anime_series'
  get 'anime-series/:anime_view/page/:page' => 'pages#anime_series'
  get 'asian-drama/all/page/:page' => 'pages#asian_series'
  get 'asian-drama/:asian_view/page/:page' => 'pages#asian_series'

  # You can have the root of your site routed with "root"
  root 'pages#index'

  mount Sidekiq::Web, at: '/sidekiq'
end
