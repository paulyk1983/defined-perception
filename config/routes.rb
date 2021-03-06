Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '/tracks' => 'tracks#index'
  get '/tracks/new' => 'tracks#new'
  post '/tracks' => 'tracks#create'

end
