Luluwrite::Application.routes.draw do
  resources :posts
  root 'posts#new'
end
