module DbFetcher
  module StepDefinitions
    class LocalRun < Basic
      def initialize(options = {})
        @target_context = :local
        super
      end

      def run(context)
        DbFetcher.logger.step_start 'LocalRun'
        context.run_command command
      end

      private

      def command
        options.fetch :command
      end
    end
  end
end
