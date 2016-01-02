Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :reservations
    get :calendar, to: 'reservations#calendar'
    root to: 'reservations#index'
  end

  resources :contacts

  get :contact,      path: 'kontakt',   to: 'pages#contact'
  get :galerie,      path: 'galerie',   to: 'pages#galerie'
  get :neighborhood, path: 'okoli',     to: 'pages#neighborhood'
  get :price,        path: 'cenik',     to: 'pages#price'
  get :reservation,  path: 'rezervace', to: 'pages#reservation'
  get :rooms,        path: 'pokoje',    to: 'pages#rooms'

  root to: 'pages#home'
end
