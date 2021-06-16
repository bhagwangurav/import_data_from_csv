Rails.application.routes.draw do
  post 'auth_user' => 'authentication#authenticate_user'
  devise_for :users
  get 'question' => 'question#index' 
  post 'import' => 'question#import'
  get 'home' => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
