require_relative '../../../test_helper'

class DbFetcher::Runtime::SshLoginTest < Minitest::Test
  def setup
    @context = mock()
    @host = 'some.com'
    @user = 'user'
    @step = DbFetcher::StepDefinitions::SshLogin.new host: @host, username: @user
  end

  def test_proper_using_context
    @context.expects(:login).with(@host, @user)
    @step.run @context
  end
end
