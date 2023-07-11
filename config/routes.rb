Rails.application.routes.draw do
  
  #......................SELL_PRODUCT.................................
  get 'sell_products/show_all', to: 'sell_products#show_all_products'
  get 'search', to: 'sell_products#search'
  resources :sell_products

  #.........................USER......................................
  post 'users/login'
  patch '/update_user', to: 'users#update_user'
  delete '/destroy_user', to: 'users#destroy_user'
  resources :users

  #.......................BUY_USER....................................
  get 'available/products', to: 'buy_products#show_available_product'
  get 'show/category', to: 'buy_products#show_data_category_wise'
  post 'purchase_product', to: 'buy_products#purchase_product'
  get 'search/history/:id', to: 'buy_products#search_in_history'
  get 'search/category/name', to: 'buy_products#search_by_category_and_name'
  resources :buy_products

  #.......................CATEGORY....................................
  resources :categories
end
 