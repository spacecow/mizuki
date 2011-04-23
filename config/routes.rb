Mizuki::Application.routes.draw do
  get "operator/welcome"

  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  match 'welcome' => 'operator#welcome'

  resources :maintenances, :only => [:index,:edit,:update,:destroy]
  resources :sessions
  resources :events
  resources :users do
    member do
      get 'edit_roles'
      put 'update_roles'
    end
  end

  root :to => "operator#welcome"
end
