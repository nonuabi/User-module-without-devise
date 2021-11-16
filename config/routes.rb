Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  get 'home/index'
  get '/account/login'
  get '/account/signup'
  post '/account/signup'
  get '/password/forget'
  get '/password/reset'
  get '/profile/edit'
end
