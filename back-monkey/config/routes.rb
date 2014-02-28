BackMonkey::Application.routes.draw do
  root :to => 'chart#index'
  post '/alcoholcalc/create.json', to: 'alcohol_calc#create'

end
