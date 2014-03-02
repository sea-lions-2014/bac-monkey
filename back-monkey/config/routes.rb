BackMonkey::Application.routes.draw do

  root :to => 'pages#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  post '/alcoholcalc/create.json', to: 'alcohol_calc#create'
  post '/caffeinecalc/create.json', to: 'caffeine_calc#create'

end
