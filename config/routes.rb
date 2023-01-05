Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index], action: :search
      resources :shopping_list_ingredients, only: [:show], action: :search
    end
  end
end
