Rails.application.routes.draw do

  root 'commands#index'

  devise_for :users

  resources :commands

  resources :tournaments, only: [:index, :show]
  post '/tournaments/:id/sign_in' => 'tournaments#sign_in', :as => 'sign_in_tournament'
  post '/tournaments/:id/sign_out' => 'tournaments#sign_out', :as => 'sign_out_tournament'

  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :via => [:post], :to => 'sessions#create'
  match '/auth/failure', :via => [:post], :to => 'sessions#failure'

end
