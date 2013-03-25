Rails.application.routes.draw do

  default_url_options :host => "localhost:3000"

  #authenticate :user do
  #  mount OpenBadges::Engine => "/open_badges"
  #end
  mount OpenBadges::Engine => "/open_badges"
end
