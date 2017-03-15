Rails.application.routes.draw do
  get '/index' => 'contacts#index'
  get '/contacts/new' => 'contacts#new'
  post '/contacts' => 'contacts#create'
  get '/contacts/:id' => 'contacts#show'
  get '/contacts/:id/edit' => 'contacts#edit'
  patch '/contacts/:id' => 'contacts#update'
  delete '/contacts/:id' => 'contacts#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
