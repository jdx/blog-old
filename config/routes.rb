Blog::Application.routes.draw do
  unless ARGV.join.include? 'assets:precompile'
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end

  resources :projects

  match "/blog/:year/:month/:day/:id" => "posts#show", :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ }

  match 'blog' => 'posts#index'
  match 'resume' => 'static#resume'

  root :to => 'static#root'
end
