OpenBadges::Engine.routes.draw do

  root :to => "application#show"

  resources :tags

  resources :badges

  resources :alignments

  resources :assertions

  resources :organizations, :only => []
  get "organization" => "organizations#show"
  post "organization" => "organizations#create"

  # public accessible json
  #get "public/badges/" => "badges#json"
  #get "public/assertions/" => "assertions#json"
  get "public/organization" => "organizations#json"

end
