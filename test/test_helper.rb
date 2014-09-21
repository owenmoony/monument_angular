ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Support files
Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each do |file|
  require file
end

class ActiveSupport::TestCase
end

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

