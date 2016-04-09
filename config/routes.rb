Rails.application.routes.draw do
  resources :tasks
  devise_for :users, controllers: { registrations: "users/registrations" }
  root "tasks#index"
  get '/complete/:id', to: 'tasks#complete', as: 'complete'
end
