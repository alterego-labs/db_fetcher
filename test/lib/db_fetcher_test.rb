require_relative '../test_helper'

class DbFetcherTest < Minitest::Test
  def test_default_contexts_attribute
    assert_equal DbFetcher.contexts, []
  end

  def test_registering_attribute
    DbFetcher.register_context :ssh
    assert DbFetcher.contexts.include?(:ssh)
  end
end
