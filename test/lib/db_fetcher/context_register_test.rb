require_relative '../../test_helper'

class DbFetcher::ContextRegisterTest < Minitest::Test
  def test_registering_attribute
    DbFetcher::ContextRegister.add :ssh
    assert_includes DbFetcher::ContextRegister.contexts, :ssh
  end
end

