Rails.application.routes.draw do
  get 'tweet/index'

  root 'tweet#index'
end
