IssueTracker::Application.routes.draw do

  resources :history_items


  resources :issues


  devise_for :users

  resources :issues, only: [:new, :create, :show]

  namespace :admin do
    resources :issues, only: [:index, :show]
    resources :history_item, only: [:new, :create, :show]
  end

  root :to => "issues#new"

end
