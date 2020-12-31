Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  resources :users, only: %i[show], param: :uuid
  resource :user_profile, only: %i[show edit update]
  get 'update_user_profile', to: 'user_profiles#update'
  resources :boards, only: %i[create]
  get 'message', to: 'boards#index', as: 'message'

  namespace :api do
    namespace :v1 do
      resources :current_user, only: %i[index]
      resources :posts, only: %i[index create update destroy], param: :uuid
      resources :boards, only: %i[index]
    end
  end
end
