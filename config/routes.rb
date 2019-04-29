Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'profile', to: 'users#profile'
  post 'signup', to: 'users#signup_user'
  post 'login', to: 'users#login_user'
  patch 'profile/edit_profile', to: 'users#edit_profile'
  patch 'profile/update_profile_img', to: 'users#update_profile_img'
  delete 'logout', to: 'users#logout_user'

  resources :articles
end
