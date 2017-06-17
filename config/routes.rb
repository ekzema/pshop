Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      unlocks: 'users/unlocks',
      passwords: 'users/passwords',
      omniauth: 'users/omniauth',
      confirmations: 'users/confirmations'
  } do

  end


  devise_scope :user do
    delete 'delete_attachment' => 'users/registrations#delete_attachment'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :feeds
  root 'welcome#index'
  resources :orders
  post 'orders/form_render'
  get 'twocat', to: 'welcome#twocat'
  get 'show', to: 'welcome#show'
  get 'aboute', to: 'welcome#aboute'
  get 'contacts', to: 'welcome#contacts'

  get 'adminpanel', to: 'adminpanel#index'
  namespace :adminpanel do
    get 'categories'
    get 'twocategories'
    get 'products'
    get 'orders'
    get 'feedback'
    get 'comments'
  end

  resources :line_items
  resources :carts
  get 'site_slide_images/create'

  resources :site_settings
  resources :comments
  get 'product_slide_images/create'

  resources :products do
    collection do
      delete 'delete_attachment'
    end
  end

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
  post 'products/form_render'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
