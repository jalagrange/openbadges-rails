OpenBadges::Engine.routes.draw do

  root :to => "application#index"

  resources :tags

  resources :badges

  resources :alignments

  resources :assertions

  resources :organizations, :only => [:index, :create, :update]

end
