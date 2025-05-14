Rails.application.routes.draw do
  devise_for :users
  root 'subscriptions#index'
  get 'thank_you', to: 'payments#thank_you', as: 'thank_you'

  resources :subscriptions do
    collection do
       get 'show_plan'
      get :monthly
      get :quarterly
      get :annually
    end
  end
  
  resources :customer_details, only: [:new, :create]
  resources :payments, only: [:new, :create]
end
