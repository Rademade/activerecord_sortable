require File.expand_path('../../spec/dummy/config/environment', __FILE__)

require 'rspec/rails'
require 'database_cleaner'
require 'jazz_hands'

RSpec.configure do |config|

  config.order = 'random'
  config.formatter = :documentation

  config.before :suite do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = 'active_record'
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

end
