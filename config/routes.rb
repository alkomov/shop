Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	root 'home#index'
	resources :carts, only: :index
	resources :items, only: :index do
    post :add_to_cart, on: :member
    delete :delete_from_cart, on: :member
    resources :orders, only: :create do
  get :success, on: :member
end
end
end