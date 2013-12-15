Sail::Application.routes.draw do

  get 'topics/:slug' => 'topics#show', as: :topic
  resources :topics, except: [ :show ]  do
    resources :notes
  end

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
