Blog::Application.routes.draw do
  unless ARGV.join.include? 'assets:precompile'
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end

  match "/:year/:month/:day/:id" => "posts#show", :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ }

  root :to => 'posts#index'
end
