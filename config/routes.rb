Rails.application.routes.draw do
  resources :hobbies
  post 'user_token' => 'user_token#create'
  resources :posts do
    member do
      put 'top'
      put 'like'
      put 'unlike'
      put 'undotop'
    end
    resources :comments do
      collection do
        delete 'des_all'
      end
      member do
        put 'like'
        put 'unlike'
        put 'top'
        put 'undotop'
      end
    end
  end 
  resources :users do
    collection do
      post 'sign_in' => 'user_token#create'
    end
  end
  
  resources :pictures
  delete 'del_all', to: 'utils#del_all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
