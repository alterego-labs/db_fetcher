require_relative '../../../test_helper'

class DbFetcher::Runtime::ContextTest < Minitest::Test
  def test_register_context_success
    DbFetcher::ContextRegister.clear
    DbFetcher::Runtime::Context.register_context :some
    assert_includes DbFetcher::ContextRegister.contexts, :some
  end
end

