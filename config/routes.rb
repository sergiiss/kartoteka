Rails.application.routes.draw do
  devise_for :users

  resources :patients do
    get 'current', on: :collection
  end
  resources :districts do
    get 'alternative', on: :collection
  end

  root to: 'districts#alternative'
end
