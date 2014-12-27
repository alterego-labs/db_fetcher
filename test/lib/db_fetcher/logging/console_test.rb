require_relative '../../../test_helper'

class DbFetcher::Logging::ConsoleTest < Minitest::Test
  def setup
    @logger = DbFetcher::Logging::Console.new
    @logger.stubs(:silently?).returns false
  end

  def test_responsebilities
    %w[write step_start].each do |method|
      assert_respond_to @logger, method
    end
  end

  def test_write
    @logger.expects(:puts)
    @logger.write 'some'
  end

  def test_silent_write
    @logger.stubs(:silently?).returns true
    @logger.expects(:puts).never
    @logger.write 'some'
  end

  def test_step_start
    @logger.expects(:write)
    @logger.step_start :local_run
  end
end
