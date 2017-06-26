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

  namespace :search do
    get 'autocomplete'
    get 'result'
  end
  resources :feeds
  root 'welcome#index'
  resources :orders
  post 'orders/form_render'
  get 'new', to: 'welcome#new'
  get 'sale', to: 'welcome#sale'
  get 'payment', to: 'welcome#payment'
  get 'about', to: 'welcome#about'
  get 'contacts', to: 'welcome#contacts'
  get 'back', to: 'welcome#back'

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

  resources :products, except: [:index] do
    collection do
      delete 'delete_attachment'
    end
  end

  resources :twocategories, except: [:index, :show] do
    collection do
      delete 'delete_attachment'
    end
  end
  get 'categories/:category/:id', to: 'twocategories#show', as: 'showtwocategory'

  resources :categories, except: [:index] do
    collection do
      delete 'delete_attachment'
    end
  end
  post 'products/form_render'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
