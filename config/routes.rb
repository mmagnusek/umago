Rails.application.routes.draw do

  namespace :admin do
    resources :reservations
  end

  get :contact,      path: 'kontakt',   to: 'pages#contact'
  get :galerie,      path: 'galerie',   to: 'pages#galerie'
  get :neighborhood, path: 'okoli',     to: 'pages#neighborhood'
  get :price,        path: 'cenik',     to: 'pages#price'
  get :reservation,  path: 'rezervace', to: 'pages#reservation'
  get :rooms,        path: 'pokoje',    to: 'pages#rooms'
  root to: 'pages#home'
end
