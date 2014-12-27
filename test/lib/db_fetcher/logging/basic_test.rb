require_relative '../../../test_helper'

class DbFetcher::Logging::BasicTest < Minitest::Test
  def setup
    @logger = DbFetcher::Logging::Basic.new
  end

  def test_responsebilities
    assert_respond_to @logger, :silently?
  end

  def test_default_is_not_silently
    assert_equal @logger.silently?, false
  end

  def test_passing_silent_flag_to_initializer
    another_logger = DbFetcher::Logging::Basic.new silent: true
    assert_equal another_logger.silently?, true
  end
end
