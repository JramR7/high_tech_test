Rails.application.routes.draw do
    # Home controller routes.
    root 'home#index'
    get 'auth' => 'home#auth'
    
    # get login token from knock
    post 'user_token' => 'user_token#create'

    # User actions
    get '/users/current' => 'users#show_current'
    resources :users
end
