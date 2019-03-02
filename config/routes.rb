Rails.application.routes.draw do
  post 'comments_create', to: 'comments#create', as: 'create_comment'
  delete 'delete_comment', to: 'comments#destroy', as: 'delete_comment'
  get 'comments/index', to: 'comments#index', as: 'top_users'
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
end
