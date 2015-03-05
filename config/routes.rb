Rails.application.routes.draw do

  root 'nearbybreweries#index'

  resources :breweries do
    resources :beers 
  end

  resources :beers do
      resources :reviews
    end

  get '/about' => 'main#about'
  get '/contact' => 'main#contact'
  get '/beerrun' => 'main#beerrun'

  get '/search' => 'nearbybreweries#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products


end
