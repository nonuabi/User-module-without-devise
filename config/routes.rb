Rails.application.routes.draw do
  resources :posts
  root to: 'posts#index'
  get '/account/login'
  get '/account/signup'
  get '/password/forget_password'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
