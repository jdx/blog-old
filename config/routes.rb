Blog::Application.routes.draw do
  unless ARGV.join.include? 'assets:precompile'
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end

  resources :projects

  match "/blog/tags/:tag" => "posts#tag"
  match "/blog/:year/:month/:day/:id" => "posts#show", :constraints => { :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/ }

  match 'blog' => 'posts#index'
  match 'skills' => 'static#skills'

  root :to => 'static#root'
end
