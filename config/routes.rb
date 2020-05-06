Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
  post "/signup", to: "user#signup"
  post "/addData", to: "quote#new"
  post "/validateData", to: "quote#validate"
end