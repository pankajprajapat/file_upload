Rails.application.routes.draw do
  resources :documents, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :shared
    end
  end
  devise_scope :user do
    # Redirests signing out users back to sign-in
    # get "users", to: "devise/sessions#new"
    authenticated :user do
      root 'documents#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/:id' => "shortener/shortened_urls#show"

end
