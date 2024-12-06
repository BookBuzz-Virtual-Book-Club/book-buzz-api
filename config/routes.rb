Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  get "/books" => "books#index"
  post "/books" => "books#create"
  get "/books/:id" => "books#show"
  patch "/books/:id" => "books#update"
  delete "/books/:id" => "books#destroy"

  get "/bookshelves" => "bookshelves#index"
  post "/bookshelves" => "bookshelves#create"
  get "/bookshelves/:id" => "bookshelves#show"
  patch "/bookshelves/:id" => "bookshelves#update"
  delete "/bookshelves/:id" => "bookshelves#destroy"

  get "/book_clubs" => "book_clubs#index"
  post "/book_clubs" => "book_clubs#create"
  get "/book_clubs/:id" => "book_clubs#show"
  patch "/book_clubs/:id" => "book_clubs#update"
  delete "/book_clubs/:id" => "book_clubs#destroy"

  get "/posts" => "posts#index"
  post "/posts" => "posts#create"
  get "/posts/:id" => "posts#show"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"

  get "/discussion_boards" => "discussion_boards#index"
  post "/discussion_boards" => "discussion_boards#create"
  get "/discussion_boards/:id" => "discussion_boards#show"
  patch "/discussion_boards/:id" => "discussion_boards#update"
  delete "/discussion_boards/:id" => "discussion_boards#destroy"

  get "/user_books" => "user_books#index"
  post "/user_books" => "user_books#create"
  get "/user_books/:id" => "user_books#show"
  patch "/user_books/:id" => "user_books#update"
  delete "/user_books/:id" => "user_books#destroy"
end
