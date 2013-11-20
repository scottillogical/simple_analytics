require 'sidekiq/web'

SimpleAnalytics::Application.routes.draw do
  
  mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'
  devise_for :admins, :controllers => { :omniauth_callbacks => "admin/omniauth_callbacks" }
  root to: 'tracking_urls#new'
  resources :redirects
  match 'page_views/create', to: 'page_views#create', via: [:get]
  match 'conversions/create', to: 'conversions#create', via: [:get]
  match 'events/create', to: 'events#create', via: [:get]
  resources :tracking_urls
  resources :conversion_pixels

  mount Sidekiq::Web, at: "/sidekiq"
  get '/admins/auth/google_apps/callback', :to => 'sessions#authenticate_admin'
end
