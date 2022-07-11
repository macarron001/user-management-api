Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  get '/user/:id', to: 'current_user#show'
  post '/create', to: 'current_user#create'
  post '/create_super', to: 'current_user#create_super'
  patch '/user/:id', to: 'current_user#update'
  delete '/user/:id', to: 'current_user#delete'

  get '/list', to: 'current_user#user_list'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end