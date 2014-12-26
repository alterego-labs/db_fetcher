require_relative '../test_helper'

class DbFetcherTest < Minitest::Test
  def setup
    DbFetcher.logger = nil
  end

  def test_responsebilities
    assert_respond_to DbFetcher, :logger
    assert_respond_to DbFetcher, :define_runner
  end

  def test_fetching_logger_by_default
    assert_kind_of DbFetcher::Logging::Console, DbFetcher.logger
  end

  def test_fetching_setted_logger
    DbFetcher.logger = :my_logger
    assert_equal :my_logger, DbFetcher.logger
  end

  def test_define_new_runner
    assert DbFetcher::Runner, DbFetcher.define_runner {}
  end

  def test_defining_runner_without_block_failes
    assert_raises(RuntimeError) { DbFetcher.define_runner }
  end
end
