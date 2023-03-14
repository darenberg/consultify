Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :offers do
    resources :bookings, only: [:show, :create, :update, :index]
  end

  resources :bookings, only: :destroy do
    member do
      patch :approve, :reject, :pending
    end
  end
end
