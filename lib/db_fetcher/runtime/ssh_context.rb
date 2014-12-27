require 'net/ssh'
require 'forwardable'

module DbFetcher
  module Runtime
    class SshContext < Context
      extend Forwardable

      register_context :ssh

      attr_reader :ssh

      def_delegator :ssh, :host

      def login(hostname, user)
        raise 'Must be logged out first' if active?
        @ssh = Net::SSH.start hostname, user
      end

      def logout
        raise 'Must be logged in first' unless active?
        ssh.close
      end

      def run_command(command)
        raise 'Must be logged in first!' unless active?
        DbFetcher.logger.command_start command
        DbFetcher.logger.answer_start host
        result = ssh.exec! command
        DbFetcher.logger.answer_body result
        DbFetcher.logger.command_finished
      end

      def active?
        !ssh.nil? && !ssh.closed?
      end
    end
  end
end

