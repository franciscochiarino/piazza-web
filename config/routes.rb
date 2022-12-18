Rails.application.routes.draw do
  root "feed#show"

  get "sign_up", to: "users#new"
  get "sugn_up", to: "users#create"
end
