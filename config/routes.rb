Rails.application.routes.draw do
  devise_for :users

  resources :patients do
    get 'current', on: :collection
  end

  root to: 'patients#current'
end
