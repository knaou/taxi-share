Rails.application.routes.draw do

  root 'welcome#show'

  get 'load_test_data' => 'demos#load_test_data'

  resources :users do
    collection do
      post :login
      get :logout
    end

  end
end
