Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard_root'

  resources :device
  resources :data, only: [:create]

  post '/device/create', to: 'device#create', as: 'device_create'

  post '/device/disable/:id', to: 'device#disable', as: 'disable_device'
  post '/device/enable/:id', to: 'device#enable', as: 'enable_device'

  post '/data/upload/', to: 'data#create'

  get '/data/serve/', to: 'data#serve'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
