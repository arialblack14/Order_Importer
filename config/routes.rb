Rails.application.routes.draw do
  resources :my_orders do
    collection { post :import }
  end
  resources :my_products do
    collection { post :import }
  end
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
