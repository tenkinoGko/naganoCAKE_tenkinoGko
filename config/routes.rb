Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'order_details/update'
    get 'orders/show'
    get 'orders/update'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
    get 'homes/top'
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
    get 'registrations/new'
    get 'registrations/create'
    resources :items, only: [:index, :show]
    get 'homes/top'
    get 'homes/about'
  end

  # トップページをルートに設定
  root to: 'public/homes#top'
end
