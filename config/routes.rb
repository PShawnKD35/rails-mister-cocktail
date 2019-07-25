Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :coctails, only: [:index, :show, :new, :delete] do
    resources :doses, only: [:new, :delete]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
