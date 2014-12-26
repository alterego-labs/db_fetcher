require_relative '../../../test_helper'

class DbFetcher::Runtime::SshContextTest < Minitest::Test
  def setup
    @ssh_context = DbFetcher::Runtime::SshContext.new
  end

  def test_success_loggining
    Net::SSH.expects(:start).with('some.com', 'user')
    @ssh_context.login 'some.com', 'user'
  end

  def test_success_running_command
    ssh = mock()
    @ssh_context.stubs(:ssh).returns ssh
    ssh.expects(:exec!).with 'some'
    @ssh_context.run_command 'some'
  end

  def test_raise_error_when_try_run_command_in_not_logged_in_context
    @ssh_context.expects(:logged_in?).returns false
    assert_raises RuntimeError do
      @ssh_context.run_command 'hostname'
    end
  end
end
