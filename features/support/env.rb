require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'

  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
