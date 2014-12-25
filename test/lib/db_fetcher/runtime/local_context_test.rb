require_relative '../../../test_helper'

class DbFetcher::Runtime::LocalContextTest < Minitest::Test
  def test_register_context_success
    assert_includes DbFetcher::ContextRegister.contexts, :local
  end
end
