OpenBadges::Engine.routes.draw do

  root :to => "application#show"

  resources :tags

  resources :badges

  resources :alignments

  resources :assertions

  resources :organizations, :only => []
  get "organization" => "organizations#show"
  post "organization" => "organizations#create"

end
