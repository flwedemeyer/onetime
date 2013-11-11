Onetime::Application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions'}

  resources :stories

  root :to => 'users#index'


end
