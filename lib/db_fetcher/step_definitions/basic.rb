module DbFetcher
  module StepDefinitions
    class Basic
      attr_reader :target_context, :options

      def initialize(options = {})
        @options = options
      end

      def run
      end
    end
  end
end
