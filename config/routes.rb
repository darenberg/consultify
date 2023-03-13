Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :dashboard, only: :show

  resources :offers do
    resources :bookings, only: [:create, :update]
  end

  resources :bookings, only: :destroy do
    member do
      patch :approve, :reject, :pending
    end
  end
end
