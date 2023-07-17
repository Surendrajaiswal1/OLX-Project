Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  #......................SELL_PRODUCT.................................
  get 'sell_products/show_all', to: 'sell_products#show_all_products'
  get 'search_product', to: 'sell_products#search_product'
  resources :sell_products

  #.........................USER......................................
  post 'users/login'
  resources :users

  #.......................BUY_PRODUCT....................................
  get 'available/products', to: 'buy_products#show_available_products'
  get 'show/category', to: 'buy_products#show_data_category_wise'
  get 'search/history/:id', to: 'buy_products#search_in_history'
  resources :buy_products

  #.......................CATEGORY....................................
  resources :categories
end
 