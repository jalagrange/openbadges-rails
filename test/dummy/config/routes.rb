Rails.application.routes.draw do
  devise_for :users

  root :to => "Application#index"

  mount OpenBadges::Engine => "/open_badges"
end
