Rails.application.routes.draw do
  resources :purchases
  get 'purchases', to: 'purchases#index'
  put 'purchases/update_status', to: 'purchases#update_status'
end
