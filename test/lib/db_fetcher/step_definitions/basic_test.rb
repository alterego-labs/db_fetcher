require_relative '../../../test_helper'

class DbFetcher::StepDefinitions::BasicTest < Minitest::Test
  def setup
    @step = DbFetcher::StepDefinitions::Basic.new
  end

  def test_responsebilities
    assert_respond_to @step, :target_context
    assert_respond_to @step, :run
  end
end
