Rails.application.routes.draw do
  defaults format: :json do
    namespace :api do
      get '/v1', to: 'v1#index'
      namespace :v1 do
        # 実行可能アクションの制限と、id指定で数字以外認めない
        resources :categories, only: %i[index show], constraints: { id: /\d+/ }
        resource :tmdb, only: [], controller: 'tmdb' do
          collection do
            get :search
          end
        end
        namespace :tmdb do
          resources :movies, only: %i[show]
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
