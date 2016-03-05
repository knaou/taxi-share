Rails.application.routes.draw do

  root 'welcome#show'

  get 'load_test_data' => 'demos#load_test_data'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'
end
