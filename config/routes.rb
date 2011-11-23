Blog::Application.routes.draw do
  unless ARGV.join.include? 'assets:precompile'
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end

  resources :posts

  root :to => 'posts#index'
end
