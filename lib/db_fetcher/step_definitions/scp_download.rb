module DbFetcher
  module StepDefinitions
    class ScpDownload < Basic
      def initialize(options = {})
        @target_context = :ssh
        super
      end

      def run(context)
        DbFetcher.logger.step_start 'ScpDownload'
        context.download remote, local
      end

      private

      def remote
        options.fetch :remote
      end

      def local
        options.fetch :local
      end
    end
  end
end
