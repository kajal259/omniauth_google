Rails.application.routes.draw do
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # get 'welcome/index'
  root to: "welcome#index"
  # devise_for :users , path_names: {sign_in: "login", sign_out: "logout"}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users , path_names: {sign_in: "login", sign_out: "logout"}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  as :user do
     get 'login' => 'sessions#new', :as => "login"
     get 'signup' => 'registrations#new', :as => "signup"  
     get 'signout' => 'devise/sessions#destroy', :as => "signout"
  end   
  resources :welcome

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# devise_for :users , path_names: {sign_in: "login", sign_out: "logout"}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
#   as :user do
#      get 'login' => 'sessions#new', :as => "login"
#      get 'signup' => 'registrations#new', :as => "signup"  
#      get 'signout' => 'devise/sessions#destroy', :as => "signout"
#   end   