Sail::Application.routes.draw do

  # Sign in/out
  get    'login'  => 'session#new',     as: :login
  post   'login'  => 'session#create'
  delete 'logout' => 'session#destroy', as: :logout
  get    'logout' => 'session#destroy'  # temporary for development

  # Password reset
  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'

  root 'site#index'
end
