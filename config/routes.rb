Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root 'items#index'

  resources :users, only: [:show,:create,:new,:delete] 
  
  resources :items do
    resources :purchases, only: [:index, :create, :new]
end

end
