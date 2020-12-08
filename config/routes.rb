Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  resources :users, param: :uuid
  resource :user_profile, only: %i[show edit update]
  get 'update_user_profile', to: 'user_profiles#update'

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index create update destroy], param: :uuid
    end
  end
end
