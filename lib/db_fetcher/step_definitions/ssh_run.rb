module DbFetcher
  module StepDefinitions
    class SshRun < Basic
      def initialize(options = {})
        @target_context = :ssh
        super
      end

      def run(context)
        DbFetcher.logger.step_start 'SshRun'
        context.run_command command
      end

      private

      def command
        options.fetch :command
      end
    end
  end
end

