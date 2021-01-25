Rails.application.routes.draw do
  resources :books
  
  #get "/" => "books#top"
  #get "/" => "books#index"
  root :to => 'books#top'

end
