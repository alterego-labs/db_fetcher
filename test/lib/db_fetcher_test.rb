require_relative '../test_helper'

class DbFetcherTest < Minitest::Test
  def test_registering_attribute
    DbFetcher.register_context :ssh
    assert DbFetcher.contexts.include?(:ssh)
  end

  def test_define_new_runner
    assert DbFetcher::Runner, DbFetcher.define_runner {}
  end

  def test_defining_runner_without_block_failes
    assert_raises(RuntimeError) { DbFetcher.define_runner }
  end
end
