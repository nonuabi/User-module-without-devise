Rails.application.routes.draw do
  root to: 'home#index'
  resources :posts
  get 'home/index'
  get '/account/login'
  get '/account/logout'
  post '/account/login'
  get '/account/signup'
  post '/account/signup'
  get '/password/forget'
  post '/password/forget'
  get '/password/reset'
  post '/password/reset'
  get '/profile/edit'
end
