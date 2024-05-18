Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
   root :to => 'homes#top'
   resources :customers, only: [:index, :edit, :update, :show]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show, :index, :new, :create, :edit, :update]
   resources :orders, only: [:index, :show, :update]
   resources :order_details, only: [:update]
  end
    namespace :public do
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
  end
  namespace :public do
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/thanks'
  get 'orders/create'
  get 'orders/index'
  get 'orders/show'
  end
  namespace :public do
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/create'
  end
  namespace :public do
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/unsubscribe'
  get 'customers/withdraw'
  end
  namespace :public do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  end
  namespace :public do
  get 'registrations/new'
  get 'registrations/create'
  end
  namespace :public do
  get 'items/index'
  get 'items/show'
  end
  namespace :public do
  get 'homes/top'
  get 'homes/about'
  end
end