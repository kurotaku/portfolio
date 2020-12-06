Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  resources :users

  namespace :api do 
    namespace :v1 do 
     resources :posts, only: [:index, :create, :update, :destroy], param: :uuid
    end 
  end 
end
