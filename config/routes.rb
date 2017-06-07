Rails.application.routes.draw do
  get '/hedgehogs' => 'hedgehogs#index'
  get '/hedgehogs/new' => 'hedgehogs#new'
  post '/hedgehogs' => 'hedgehogs#create'
  get '/hedgehogs/:id' => 'hedgehogs#show'
  get '/hedgehogs/:id/edit' => 'hedgehogs#edit'
  patch '/hedgehogs/:id' => 'hedgehogs#update'
end
