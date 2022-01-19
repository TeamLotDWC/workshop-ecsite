Rails.application.routes.draw do

devise_for :customers,skip: [:passwords, :registrations], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}
devise_scope :customer do
  get 'customers/cancel' => 'public/registrations#cancel', as: :cancel_customer_registration
  get 'customers/signup' => 'public/customers/sign_up#new', as: :new_customer_registration
  post 'customers' => 'public/registrations#create', as: :customer_registration
  
end

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: 'admin/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'about' => 'homes#about'

  scope module: :public do
    resource :customers, only: [:show, :edit, :update] do
      collection do
        patch 'delete'
        get 'confirm_delete'
      end
      resources :shipping_addresses, only: [:index, :edit ,:create, :update, :destroy]
      resources :cart_items, only: [:index, :create, :update, :destroy] do
        delete 'reset', on: :collection
      end
      resources :orders, only:[:new, :index, :show, :create] do
        collection do
          get 'confirm'
          get 'complete'
        end
      end
    end
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:update]
    resources :items
    resources :genres, only: [:index,:create,:edit,:update, :show]
    resources :orders, only: [:index,:show,:update] do
      resources :order_items, only: [:update]
    end
  end

end
