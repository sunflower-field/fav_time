Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'publics/registrations',
    passwords: 'publics/passwords',
    sessions: 'publics/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admins/sessions"
  }

  root to: 'publics/homes#top'

  namespace :admins do
    root to: 'homes#top'
    resources :comments, only: [:show, :index, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_favtimes, only: [:index, :update, :show, :edit]
  end

  namespace :publics do
    post '/homes/guest_sign_in', to: 'homes#new_guest'
    get "users/my_page" => "users#show", as: "show"
    resources :post_tags do
      get 'posts', to: 'posts#search'
    end
    resources :post_favtimes, only:[:new, :create, :edit, :index, :show, :update, :destroy] do
      collection do
       get 'search'
      end
      resource :likes, only: [:create, :destroy]
      resources :comments, except: [:index, :show]
    end
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :users, only: [:update, :show, :edit, :index]

    resources :post_tags do
      get 'post_favtimes', to: 'post_favtimes#search'
    end
  end

end
