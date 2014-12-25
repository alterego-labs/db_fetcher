require_relative '../../../test_helper'

class DbFetcher::StepDefinitions::BasicTest < Minitest::Test
  def setup
    @options = { some_key: :some_val }
    @step = DbFetcher::StepDefinitions::Basic.new @options
  end

  def test_initialization_with_options
    assert_equal @step.options, @options
  end

  def test_responsebilities
    assert_respond_to @step, :target_context
    assert_respond_to @step, :run
    assert_respond_to @step, :options
  end
end
