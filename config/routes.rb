Rails.application.routes.draw do
  root 'archives#index', defaults: { category: 'nonadult' }
  resources :archives, only: [:index, :show], param: :uuid

  get '/guidline',  to: 'static_pages#guidline', as: :guidline

  get 'pickups',           to: 'archives#pickups', as: :pickups
  get 'pickups/:category', to: 'archives#pickups', as: :pickups_category

  get 'sites/:site', to: 'archives#index', as: :site
  get '(:category)',   to: 'archives#index', as: :category, defaults: { category: 'nonadult' }

  get 'rss/:category.:format', to: 'feeds#show', as: :rss, defaults: { format: 'xml' } 

  resource :registration, only: [:new, :create]
  resource :contact, only: [:new, :create]

  namespace :admin do
    resources :sites
  end
end
