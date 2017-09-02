Rails.application.routes.draw do
  root 'archives#index'
#  get '/help', to: 'static_pages#help'
  resources :archives, only: [:index, :show]
end
