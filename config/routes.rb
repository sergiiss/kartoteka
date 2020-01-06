Rails.application.routes.draw do
  devise_for :users

  resources :patients do
    get 'current', on: :collection
  end
  resources :districts do
    get 'alternative', on: :collection

    resources :quality_controls do
      resources :decrees do
        resources :paragraphs
      end
    end
  end

  root to: 'districts#alternative'
end
