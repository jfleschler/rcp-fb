RcpFb::Application.routes.draw do
  
  resources :ingredients
  resources :associations, :only => [:new, :update]
  resources :users 

  resources :steps,          :only => [:update] do
    post :prioritize, :on => :collection
    #post :save_note, :on => :collection
  end
  resources :recipes,        :only => [:update] do
    post :prioritize, :on => :collection
  end

  resources :recipes, :except => [:update] do
    resources :steps, :except => [:update] do
      resources :associations, :except => [:new, :update]
    end
  end
  
  match 'recipes/:id/toggle' => 'recipes#toggle'
  match 'recipes/:id/create_ingredient' => 'recipes#create_ingredient'
  match 'recipes/:id/remove_ingredient' => 'recipes#remove_ingredient'
  match 'steps/:id/save_note' => 'steps#save_note'
  match 'ingredients/search' => 'ingredients#search'
  
  match '/auth/:provider/callback' 	=> 'sessions#create'
  match '/auth/failure' 			=> 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin'  => 'sessions#new', :as => :signin

  root :to => 'home#index'
end
