IssueTracker::Application.routes.draw do

  devise_for :users

  resources :issues, only: [:new, :create, :show] do
    resources :history_items, only: [:new, :create]
  end

  namespace :admin do
    root to: "issues#index"
    resources :issues, only: [:index, :show] do
      get :take_ownership, on: :member
      get :filter, on: :collection
      get :search, on: :collection
      resources :history_items, only: [:new, :create]
    end
  end

  root :to => "issues#new"

end
