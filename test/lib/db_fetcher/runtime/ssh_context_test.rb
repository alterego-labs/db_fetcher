require_relative '../../../test_helper'

class DbFetcher::Runtime::SshContextTest < Minitest::Test
  def setup
    @ssh_context = DbFetcher::Runtime::SshContext.new
    @ssh = mock()
    @ssh_context.stubs(:ssh).returns @ssh
  end

  def test_success_loggining
    @ssh_context.expects(:active?).returns false
    Net::SSH.expects(:start).with('some.com', 'user')
    @ssh_context.login 'some.com', 'user'
  end

  def test_failure_login_when_active
    @ssh_context.expects(:active?).returns true
    assert_raises RuntimeError do
      @ssh_context.login 'some.com', 'user'
    end
  end

  def test_logout_when_active
    @ssh_context.expects(:active?).returns true
    @ssh.expects(:close)
    @ssh_context.logout
  end

  def test_logout_raises_error_when_not_active
    @ssh_context.expects(:active?).returns false
    assert_raises RuntimeError do
      @ssh_context.logout
    end
  end

  def test_success_running_command
    @ssh_context.expects(:active?).returns true
    @ssh.expects(:exec!).with 'some'
    @ssh_context.run_command 'some'
  end

  def test_raise_error_when_try_run_command_in_not_logged_in_context
    @ssh_context.expects(:active?).returns false
    assert_raises RuntimeError do
      @ssh_context.run_command 'hostname'
    end
  end

  def test_active_is_false_when_ssh_is_nil
    @ssh_context.stubs(:ssh).returns nil
    assert_equal false, @ssh_context.active?
  end

  def test_active_is_false_when_ssh_is_closed
    @ssh.expects(:closed?).returns true
    assert_equal false, @ssh_context.active?
  end
end
