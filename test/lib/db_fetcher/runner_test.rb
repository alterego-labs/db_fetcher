require_relative '../../test_helper'

class DbFetcher::RunnerTest < Minitest::Test
  def test_responsebilities
    obj = DbFetcher::Runner.new
    assert_respond_to obj, :steps
    assert_respond_to obj, :define_steps
    assert_respond_to obj, :run
  end
end
