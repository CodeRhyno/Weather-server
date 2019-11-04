Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard_root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
