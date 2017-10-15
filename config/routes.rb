Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :feedbacks, only: [:index, :new, :create]
  root to: "feedbacks#new"
end
