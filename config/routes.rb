Rails.application.routes.draw do
  get 'git_user/index'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  get '/git_users', to: 'git_users#index'
  post '/git_users/show', to: 'git_users#show'
end
