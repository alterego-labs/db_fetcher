require_relative '../../../test_helper'

class DbFetcher::StepDefinitions::SshRunTest < Minitest::Test
  def setup
    @context = Minitest::Mock.new
    @step = DbFetcher::StepDefinitions::SshRun.new command: 'some'
  end

  def test_proper_using_context
    @context.expect :run_command, true, ['some']
    @step.run @context
    assert @context.verify
  end
end

