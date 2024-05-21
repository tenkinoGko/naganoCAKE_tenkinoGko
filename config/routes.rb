Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }, path_names: { sign_out: 'sign_out' }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }, path_names: { sign_out: 'sign_out' }

  root to: 'public/homes#top'

  get 'customers/my_page', to: 'public/customers#show', as: :customers_my_page

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]

    delete 'sign_out', to: 'sessions#destroy', as: :admin_sign_out
  end

  scope module: 'public' do
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all', as: :cart_items_destroy_all
    
    resources :customers, only: [:show, :edit, :update]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :items, only: [:index, :show]

    
    patch 'customers/update', to: 'customers#update', as: :customers_update
    get 'customers/unsubscribe', to: 'customers#unsubscribe', as: :customers_unsubscribe
    patch 'customers/withdraw', to: 'customers#withdraw', as: :customers_withdraw

    get 'homes/top', to: 'homes#top', as: :homes_top
    get 'about', to: 'homes#about', as: :homes_about

    get 'registrations/new'
    get 'registrations/create'
    post 'orders/confirm', to: 'orders#confirm', as: :orders_confirm
    get 'orders/thanks', to: 'orders#thanks', as: :orders_thanks
  end

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_scope :customer do
   resources :addresses
  end

end
