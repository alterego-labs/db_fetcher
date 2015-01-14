require 'net/ssh'
require 'net/scp'
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
        DbFetcher.logger.command_start "ssh #{user}@#{hostname}"
        @ssh = Net::SSH.start hostname, user
        DbFetcher.logger.command_finished
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

      def upload(remote_path, local_path)
        raise 'Must be logged in first!' unless active?
        DbFetcher.logger.command_start "Uploading remote #{remote_path} to local #{local_path}"
        DbFetcher.logger.answer_start host
        ssh.scp.upload!(remote_path, local_path) do |ch, name, sent, total|
          percent = (sent.to_f * 100 / total.to_f).to_i
          DbFetcher.logger.upload_progress percent
        end
        DbFetcher.logger.command_finished
      end

      def active?
        !ssh.nil? && !ssh.closed?
      end
    end
  end
end

