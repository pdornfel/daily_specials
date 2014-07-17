Rails.application.routes.draw do

  root 'subscriptions#index'

  resources :subscriptions, :only => [:create, :index, :destroy]
  resources :feeds, :only => [:index, :new, :create, :edit, :update, :show]

  get 'subscriptions/:id' => 'subscriptions#destroy'

end
