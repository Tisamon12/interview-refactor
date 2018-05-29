Rails.application.routes.draw do
  devise_for :users

  root 'tv_shows#index'
  resources :tv_shows do
    resources :episodes
  end
end
