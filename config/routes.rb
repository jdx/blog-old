Blog::Application.routes.draw do
  unless ARGV.join.include? 'assets:precompile'
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end

  resources :projects

  match "/blog/:year/:month/:day/:id" => 'posts#redirect', :constraints => { :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/ }

  match 'about' => 'static#about'
  match 'blog' => redirect('/', permanent: true)
  match 'skills' => 'static#skills'

  match "/tags/:tag" => "posts#tag"

  match 'sitemap' => 'sitemap#index'
  match 'posts.rss' => redirect('/posts.xml', permanent: true)
  match 'posts' => 'posts#index'

  match "/:id" => "posts#show"

  root :to => 'posts#index'
end
