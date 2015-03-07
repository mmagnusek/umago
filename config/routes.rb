Rails.application.routes.draw do

  namespace :admin do
    resources :reservations
  end

  get :rooms,         path: 'pokoje',    to: 'pages#rooms'
  get :neighborhood,  path: 'okoli',     to: 'pages#neighborhood'
  get :galerie,       path: 'galerie',   to: 'pages#galerie'
  get :contact,       path: 'kontakt',   to: 'pages#contact'
  get :reservation,   path: 'rezervace', to: 'pages#reservation'
  root to: 'pages#home'
end
