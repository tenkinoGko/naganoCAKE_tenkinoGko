Rails.application.routes.draw do


 devise_for :customers, skip: [:passwords], controllers: {

    registrations: "public/registrations",
    sessions: 'public/sessions'
  },path_names: { sign_out: 'sign_out' }


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  },path_names: { sign_out: 'sign_out' }

  root to: 'public/homes#top'

  namespace :public do
    get 'customers/my_page', to: 'customers#show', as: :customers_my_page

    
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]

    get 'customers/show', to: 'customers#show', as: :customers_show
    get 'customers/edit', to: 'customers#edit', as: :customers_edit
    patch 'customers/update', to: 'customers#update', as: :customers_update
    get 'customers/unsubscribe', to: 'customers#unsubscribe', as: :customers_unsubscribe
    patch 'customers/withdraw', to: 'customers#withdraw', as: :customers_withdraw

    get 'homes/top', to: 'homes#top', as: :homes_top
    get 'homes/about', to: 'homes#about', as: :homes_about


    get 'registrations/new'
    get 'registrations/create'
  end


   namespace :admin do
   root :to => 'homes#top'
   resources :customers, only: [:index, :edit, :update, :show]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show, :index, :new, :create, :edit, :update, :destroy]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]

   delete 'sign_out', to: 'sessions#destroy'
  end


  scope module: 'public' do
    resources :items, only: [:show, :index]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
   end
   
  
end