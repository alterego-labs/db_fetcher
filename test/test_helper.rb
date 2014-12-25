require 'minitest/autorun'
require 'mocha/mini_test'

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each do |file|
  require file
end

module DbFetcher
  module StepDefinitions
    class SomeFeet < Basic
    end
  end
end
