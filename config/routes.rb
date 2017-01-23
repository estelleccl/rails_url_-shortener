Rails.application.routes.draw do
  root 'urls#new'

  post '/', to: 'urls#create'
  # get '/loaderio-46bbf5db6d7894b03230c6fd4e64ad92', to: 'urls#stress_test'
  get '/url', to: 'urls#show'
  get '/*short_url', to: 'urls#show'
 
end
