Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get '/google4d9e386ef35cdb35', to: 'pages#google4d9e386ef35cdb35'

  resources :stores

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stores, only: [:index, :show]
    end
  end

  resources :search, only: [:index]
  resources :profiles, only: [:index]
end
