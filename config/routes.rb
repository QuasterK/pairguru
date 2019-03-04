Rails.application.routes.draw do
  post 'comments_create', to: 'comments#create', as: 'create_comment'
  delete 'delete_comment', to: 'comments#destroy', as: 'delete_comment'
  devise_for :users

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end

  resources :users, only: :index do
    member do
      get "comments"
    end
  end
end
