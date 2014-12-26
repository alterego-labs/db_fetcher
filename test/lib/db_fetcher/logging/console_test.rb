require_relative '../../../test_helper'

class DbFetcher::Logging::ConsoleTest < Minitest::Test
  def setup
    @logger = DbFetcher::Logging::Console.new
  end

  def test_write
    @logger.expects(:puts)
    @logger.write 'some'
  end
end
