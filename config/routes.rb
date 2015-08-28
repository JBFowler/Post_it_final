PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do

    member do
      post 'vote'
    end

    # collection do
      # get 'archives' /posts/archives
    # end

    resources :comments, only: [:create] do

      member do
        post 'vote'
      end
    end
  end
  resources :categories, only: [:new, :show, :create]
  resources :users, only: [:show, :create, :edit, :update]


end