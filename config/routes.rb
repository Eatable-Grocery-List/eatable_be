Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index], action: :search
    end
  end
end
