Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :home, only: :show

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"

  root to: 'home#show'
end
