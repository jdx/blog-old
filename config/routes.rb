Blog::Application.routes.draw do
  devise_for :admin_users

  resources :projects

  get "/blog/:year/:month/:day/:id" => 'posts#redirect', :constraints => { :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/ }

  get 'about' => 'static#about'
  get 'blog' => redirect('/', permanent: true)
  get 'skills' => 'static#skills'

  get "/tags/:tag" => "posts#tag"

  get 'sitemap' => 'sitemap#index'
  get 'posts.rss' => redirect('/posts.xml', permanent: true)
  get 'posts' => 'posts#index'

  get "/:id" => "posts#show"

  root :to => 'posts#index'
end
