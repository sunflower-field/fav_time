Rails.application.routes.draw do
 
  
  namespace :admins do
    get 'post_comments/destroy'
    get 'post_comments/index'
    get 'post_comments/show'
  end
  namespace :admins do
    get 'users/edit'
    get 'users/update'
    get 'users/index'
    get 'users/show'
  end
  namespace :admins do
    get 'post_favtimes/edit'
    get 'post_favtimes/update'
    get 'post_favtimes/index'
    get 'post_favtimes/show'
  end
  namespace :admins do
    get 'homes/top'
  end
  namespace :publics do
    get 'post_tags/destroy'
    get 'post_tags/index'
    get 'post_tags/show'
  end
  namespace :publics do
    get 'likes/destroy'
    get 'likes/create'
  end
  namespace :publics do
    get 'post_comments/edit'
    get 'post_comments/update'
    get 'post_comments/destroy'
    get 'post_comments/create'
    get 'post_comments/new'
  end
  namespace :publics do
    get 'post_favtimes/show'
    get 'post_favtimes/edit'
    get 'post_favtimes/update'
    get 'post_favtimes/index'
    get 'post_favtimes/destroy'
    get 'post_favtimes/new'
    get 'post_favtimes/create'
  end
  namespace :publics do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/index'
  end
  namespace :publics do
    get 'homes/top'
  end
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

 root to: 'public/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
