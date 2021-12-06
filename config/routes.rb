Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'recipes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :recipes, only: %i[index show] do
    collection do
      get :recipe_by_ingredients
    end
  end
end
