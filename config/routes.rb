Rails.application.routes.draw do
    # Home controller routes.
    root 'home#index'
    get 'auth' => 'home#auth'
    
    # get login token from knock
    post 'user_token' => 'user_token#create'

    # User routes
    get '/users/current' => 'users#show_current'
    put '/users/current' => 'users#update_current'
    resources :users, only: [:index, :show, :create, :update]

    # Credit card routes
    get '/users/current/credit_cards/' => 'credit_cards#index_current'
    get '/users/current/credit_cards/:id' => 'credit_cards#show_current'
    post '/users/current/credit_cards/' => 'credit_cards#create_current'
    put '/users/current/credit_cards/:id' => 'credit_cards#update_current'
    put '/users/:user_id/credit_cards/:id' => 'credit_cards#update'
    delete '/users/current/credit_cards/:id' => 'credit_cards#delete_current'
    delete '/users/:user_id/credit_cards/:id' => 'credit_cards#delete'
    resources :credit_cards, only: [:index, :show, :update]

    # Location routes
    resources :locations, only: [:index]

    # Bank routes
    resources :banks, only: [:index]
end
