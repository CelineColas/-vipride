Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # /cars       # index
  # /cars/:id   # a car page - show
  resources :cars, only: [:index, :show] do
    # /cars/:id/bookings/new # create a request on a specific car - nesting
    # /cars/:id/bookings POST # create action - receives data from the form
    resources :bookings, only: [:new, :create]
  end

  namespace :dashboard do
    # /dashboard/profile # overview of the profile
    # /dashboard/profile/edit # form containing user details
    # /dashboard/profile PATCH # update action
    resource :profile, only: [:show, :edit, :update]

    # /dashboard/cars # listing the user cars
    # /dashboard/cars/new # creating a car
    # /dashboard/cars POST # create action
    # /dashboard/cars/:id/edit # editing one of the the user cars
    resources :cars, only: [:index, :new, :create, :edit, :update]

    # /dashboard/bookings # listing the bookings you made
    resources :bookings, only: [:index] do
      member do
        patch :approve
        patch :reject
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
