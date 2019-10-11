Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'profile', to: 'users#profile'
  post 'signup', to: 'users#signup_user'
  post 'login', to: 'users#login_user'
  patch 'profile/edit_profile', to: 'users#edit_profile'
  patch 'profile/update_profile_img', to: 'users#update_profile_img'
  get 'users/:id', to: 'users#show'
  post 'users/:id/following', to: 'users#follow_user'
  delete 'logout', to: 'users#logout_user'

  scope "articles" do
    get "/search" => "articles#search"
    patch "/:id" => "articles#update"
    delete "/:article_id/likes" => "articles#dislike_article"
    post "/:article_id/likes" => "articles#like_article"
    post "/:id/comments" => "comments#create"
  end
  
  resources :articles, param: :slug, except: [:update] do
    resources :comments
  end
  resources :categories

end
