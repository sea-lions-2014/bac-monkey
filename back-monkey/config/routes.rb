BackMonkey::Application.routes.draw do

  root :to => 'pages#index'

  post '/alcoholcalc/create.json', to: 'alcohol_calc#create'
  post '/caffeinecalc/create.json', to: 'caffeine_calc#create'
  post '/nicotine/create.json', to: 'nicotine_calc#create'

end
