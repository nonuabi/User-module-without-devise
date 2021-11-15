Rails.application.routes.draw do
  resources :posts
  root to: 'posts#index'
  get '/account/login'
  get '/account/signup'
  get '/password/forget'
  get '/password/reset'
  get '/profile/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
