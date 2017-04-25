Rails.application.routes.draw do
  get 'profile' => 'user#index'
  get 'users' => 'user#edit'
  get '/users/:id' => 'user#show'

  get 'invite/:id' => 'user#invite'
  get 'ignore/:id' => 'user#uninvite'
  get 'accept/:id' => 'user#connect'
  get 'delete/:id' => 'user#delete'

  get '/' => 'session#index'
  post '/new' => 'session#create'
  get '/' => 'session#index'
  post '/login' => 'session#login'
  get '/logout' => 'session#logout'

end
