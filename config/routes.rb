Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "publics/registrations",
    sessions: 'publics/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admins/sessions"
  }

  root to: 'publics/homes#top'

  namespace :admins do
    root to: 'homes#top'
    resources :post_comments, only: [:show, :index, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_favtimes, only: [:index, :update, :show, :edit]
  end

  namespace :publics do
    get "users/my_page" => "users#show", as: "show"
    resources :post_tags, only: [:show, :index, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :post_comments, except: [:index, :show]
    resources :post_favtimes
    resources :users, only: [:update, :show, :edit, :index]
  end

end
