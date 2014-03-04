BackMonkey::Application.routes.draw do

  root :to => 'pages#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  post '/alcoholcalc/create.json', to: 'alcohol_calc#create', :as => 'alcohol_calc'
  post '/caffeinecalc/create.json', to: 'caffeine_calc#create', :as => 'caffeine_calc'
  post '/nicotine/create.json', to: 'nicotine_calc#create', :as => 'nicotine_calc'

end
