Rails.application.routes.draw do
  get 'tweet/index'
  get 'tweet/delete_tweets'
  get '/auth/:provider/callback' => 'session#create'

  delete '/logout', to: 'session#destroy'

  root 'tweet#index'
end
