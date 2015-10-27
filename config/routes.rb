Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :user, only: [:index, :show] do
    resources :books
  end
end
