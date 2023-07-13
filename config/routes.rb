Rails.application.routes.draw do
  
  #......................SELL_PRODUCT.................................
  get 'sell_products/show_all', to: 'sell_products#show_all_products'
  get 'search_product', to: 'sell_products#search_product'
  resources :sell_products

  #.........................USER......................................
  post 'users/login'
  get 'show_all_users', to: 'users#show_all_users'
  resource :users

  #.......................BUY_PRODUCT....................................
  get 'available/products', to: 'buy_products#show_available_product'
  get 'show/category', to: 'buy_products#show_data_category_wise'
  get 'search/history/:id', to: 'buy_products#search_in_history'
  get 'search/category/name', to: 'buy_products#search_by_category_and_name'
  resources :buy_products

  #.......................CATEGORY....................................
  resources :categories
end
 