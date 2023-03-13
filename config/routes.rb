Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :offers do
    resources :bookings, only: [:create, :update, :destroy]
  end
end
