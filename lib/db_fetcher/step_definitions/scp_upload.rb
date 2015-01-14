module DbFetcher
  module StepDefinitions
    class ScpUpload < Basic
      def initialize(options = {})
        @target_context = :ssh
        super
      end

      def run(context)
        DbFetcher.logger.step_start 'ScpUpload'
        context.upload remote, local
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
