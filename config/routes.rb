Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get :about, to: "homes#about"
    resources :items, only: [:index, :show]

    scope :customers do
      get :my_page, to: "customers#show"
      scope :infomation do
        get "edit", to: "customers#edit", as: "update_customer"
        patch root to: "customers#update", as: "edit_customer"
      end
      get "unsubcribe", to: "customers#unsubcribe", as: "unsubcribe"
      patch "withdraw", to: "customers#withdraw", as: "withdraw"
      get "not_active", to: "customers#not_active", as: "not_active"
    end

    scope :cart_items do
      delete :destroy_all, to: "cart_items#destroy_all"
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] 

    scope :orders do
      get :confirm, to: "orders#confirm"
      get :thanks, to: "orders#thanks"
    end
    resources :orders, only: [:new, :index, :create, :show]
    resources :address, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :items
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update] do
      member do
        get :show_orders
      end
    end
    resources :orders, only: [:index, :show, :update] do
      resources :order_details, only: :update
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
