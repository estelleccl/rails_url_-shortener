Rails.application.routes.draw do
  root 'urls#new'

  post '/', to: 'urls#create'
  get '/url', to: 'urls#show'
  # get '/*short_url', to: 'urls#show'
 
end
