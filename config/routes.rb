Rails.application.routes.draw do
  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :via => [:post], :to => 'sessions#create'
  match '/auth/failure', :via => [:post], :to => 'sessions#failure'

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/failure'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
