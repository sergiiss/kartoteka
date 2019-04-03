Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :patients do
    get 'current', on: :collection
  end

  root to: 'patients#current'
end
