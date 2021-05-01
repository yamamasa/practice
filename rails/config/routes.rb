Rails.application.routes.draw do
  defaults format: :json do
    root 'top#index'
    namespace :api do
      get '/v1', to: 'v1#index'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
