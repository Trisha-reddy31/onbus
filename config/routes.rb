Rails.application.routes.draw do
  get "buses/start"
  get "buses/book"
  devise_for :users

  # Set home page
  root 'subscriptions#index'

  # Thank You Page
  get 'thank_you', to: 'thank_you#index', as: 'thank_you'
  post 'book_bus', to: 'buses#book', as: 'book_bus'
  get 'booking_confirmation/:pnr', to: 'buses#confirmation', as: 'booking_confirmation'

  # Journeys routes (corrected)
  resources :journeys, only: [] do
    collection do
      get 'start'                    # journeys_start_path
      get 'select_seat'             # journeys_select_seat_path
      post 'confirm_booking'        # confirm_booking_journeys_path
      get 'booking_confirmation/:id', to: 'journeys#booking_confirmation', as: 'booking_confirmation'
    end
  end
  get 'journeys/select_seat', to: 'journeys#select_seat', as: 'journeys_select_seat'

  # Subscription-related routes
  resources :subscriptions do
    collection do
      get 'show_plan'
      get :monthly
      get :quarterly
      get :annually
    end
  end

  # Customer details and payments
  resources :customer_details, only: [:new, :create]
  resources :payments, only: [:new, :create]
end
