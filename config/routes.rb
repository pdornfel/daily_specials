Rails.application.routes.draw do

  root 'subscriptions#index'

  resources :subscriptions, :only => [:create, :index]
  resources :feeds, :only => [:index, :new, :create, :edit, :update, :show]

end
