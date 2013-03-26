OpenBadges::Engine.routes.draw do
  resources :assertions

  root :to => "application#show"

  resources :organizations, :only => []
  get "organization" => "organizations#show"
  post "organization" => "organizations#create"

  resources :badges

  resources :tags

  resources :alignments

  # public accessible json
  #get "public/badges/" => "badges#json"
  #get "public/assertions/" => "assertions#json"
  get "public/organization" => "organizations#json"

end
