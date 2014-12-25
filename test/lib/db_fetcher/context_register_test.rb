require_relative '../../test_helper'

class DbFetcher::ContextRegisterTest < Minitest::Test
  def test_registering_attribute
    DbFetcher::ContextRegister.clear
    DbFetcher::ContextRegister.add :ssh
    assert_includes DbFetcher::ContextRegister.contexts, :ssh
    DbFetcher::ContextRegister.clear
  end

  def test_instantiating_contexts
    DbFetcher::ContextRegister.clear
    DbFetcher::ContextRegister.add :local
    contexts = DbFetcher::ContextRegister.contexts_instances
    assert_equal contexts.count, 1
    assert_kind_of DbFetcher::Runtime::LocalContext, contexts[:local]
    DbFetcher::ContextRegister.clear
  end
end

