require 'minitest/autorun'

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each do |file|
  require file
end

module DbFetcher
  module StepDefinitions
    class SomeFeet < Basic
    end
  end
end
