require_relative '../../test_helper'

class DbFetcher::ContextRegisterTest < Minitest::Test
  def setup
    DbFetcher::ContextRegister.clear
  end

  def teardown
    DbFetcher::ContextRegister.clear
  end

  def test_registering_attribute
    DbFetcher::ContextRegister.add :ssh
    assert_includes DbFetcher::ContextRegister.contexts, :ssh
  end

  def test_getting_context_by_code
    DbFetcher::ContextRegister.add :local
    result = DbFetcher::ContextRegister.get :local
    assert_kind_of DbFetcher::Runtime::LocalContext, result
  end

  def test_instantiating_contexts
    DbFetcher::ContextRegister.add :local
    contexts = DbFetcher::ContextRegister.contexts_instances
    assert_kind_of DbFetcher::Runtime::LocalContext, contexts[:local]
  end
end

