Rails.application.routes.draw do

  root 'welcome#index'

  get 'adminpanel', to: 'adminpanel#index'
  namespace :adminpanel do
    get 'categories'
    get 'twocategories'
    get 'products'
  end

  resources :line_items
  resources :carts
  get 'site_slide_images/create'

  resources :site_settings
  resources :comments
  get 'product_slide_images/create'

  resources :products

  resources :twocategories, except: [:index] do
    collection do
      delete 'delete_attachment'
    end
  end

  resources :categories, except: [:index] do
    collection do
      delete 'delete_attachment'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
