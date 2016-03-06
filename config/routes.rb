Rails.application.routes.draw do

  root 'welcome#show'

  get 'load_test_data' => 'demos#load_test_data'

  resources :areas

  resources :users do
    collection do
      post :login
      get :logout
    end
  end

  resources :assignments do
    member do
      post :reply
    end
  end
  resources :requirements

end
