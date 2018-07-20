Rails.application.routes.draw do
  get 'braintree/new'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/users/:id" => "users#show", as: "profile"
  get "/users/:id/edit" => "users#edit"
  patch "/users/:id" => "users#update", as: "update"
	root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
  get 'listings/index'

  post 'braintree/checkout'

  resources :listings, controller:"listings" do
    resources :reservations, except: [:index]
  end 
   resources :reservations, only:[:index]

   get '/search' => "listings#search", as: "search"


end

