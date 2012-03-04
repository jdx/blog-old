require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'

  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
