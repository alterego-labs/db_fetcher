require 'net/ssh'

module DbFetcher
  module Runtime
    class SshContext < Context
      register_context :ssh

      attr_reader :ssh

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
        ssh.exec! command
      end

      def active?
        !ssh.nil? && !ssh.closed?
      end
    end
  end
end

