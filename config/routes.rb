Rails.application.routes.draw do
  devise_for :users


  resources :user, only: [:index, :show] do
    resources :books
  end

  authenticated :user do
    root 'welcome#panel', as: "authenticated_root"
  end

  root 'welcome#index'
end
