Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  root to: 'articles#index'

  get '/articles', to: 'articles#index', as: 'articles'
  get '/articles/new', to: 'articles#new', as: 'new_article'
  post '/articles', to: 'articles#create'
  get '/articles/:id', to: 'articles#show', as: 'article'
  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  patch '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
end
