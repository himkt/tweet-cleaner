Rails.application.routes.draw do
  get 'tweet/index'
  get '/auth/:provider/callback' => 'session#create'

  root 'tweet#index'
end
