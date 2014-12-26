require 'net/ssh'

module DbFetcher
  module Runtime
    class SshContext < Context
      register_context :ssh

      attr_reader :ssh

      def login(hostname, user)
        @ssh = Net::SSH.start hostname, user
      end

      def run_command(command)
        raise 'Must be logged in first!' unless logged_in?
        ssh.exec! command
      end

      private

      def logged_in?
        !ssh.nil?
      end
    end
  end
end

