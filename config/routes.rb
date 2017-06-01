Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'site_slide_images/create'

  resources :site_settings
  resources :comments
  get 'product_slide_images/create'

  resources :products
  resources :twocategories
  resources :categories
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
