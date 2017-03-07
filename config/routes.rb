Rails.application.routes.draw do
  get '/contacts' => 'contacts#show_me_the_contact'
  get '/all_contacts' => 'contacts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
