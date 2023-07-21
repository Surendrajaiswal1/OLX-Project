Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  #......................SELL_PRODUCT.................................
  resources :sell_products

  #.........................USER......................................
  post 'users/login'
  resources :users

  #.......................BUY_PRODUCT....................................
  get 'available/products', to: 'buy_products#show_available_products'
  get 'show/category', to: 'buy_products#show_data_category_wise'
  resources :buy_products

  #.......................CATEGORY....................................
  resources :categories
end
 