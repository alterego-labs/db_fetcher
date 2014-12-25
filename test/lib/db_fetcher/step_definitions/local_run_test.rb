require_relative '../../../test_helper'

class DbFetcher::StepDefinitions::LocalRunTest < Minitest::Test
  def setup
    @context = Minitest::Mock.new
    @step = DbFetcher::StepDefinitions::LocalRun.new command: 'some'
  end

  def test_proper_using_context
    @context.expect :run_command, true, ['some']
    @step.run @context
    assert @context.verify
  end
end
