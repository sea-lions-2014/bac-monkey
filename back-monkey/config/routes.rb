BackMonkey::Application.routes.draw do

  root :to => 'pages#index'

  post '/alcoholcalc/create.json', to: 'alcohol_calc#create'

end
