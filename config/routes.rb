Rails.application.routes.draw do


devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'


  resource :customers, only: [:show, :edit, :update] do
    get "" => "#"
    get "" => "#"
    resources :shipping_addresses, only: [:index, :edit ,:create, :update, :destroy]
  end





  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:update]
    resources :items, only: [:index,:new,:create,:show,:edit,:update,]
    resources :genres, only: [:index,:create,:edit,:update, :show]
    resources :orders, only: [:index,:show,:update] do
      member do
          resource :order_items,only: [:update]
      end
    end
  end

end
