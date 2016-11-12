Rails.application.routes.draw do
  devise_for :users
  root 'orders#index'
  resources :orders do
    collection { post :import}
  end
end
