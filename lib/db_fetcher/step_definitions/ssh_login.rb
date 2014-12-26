module DbFetcher
  module StepDefinitions
    class SshLogin < Basic
      def initialize(options = {})
        @target_context = :ssh
        super
      end

      def run(context)
        context.login host, username
      end

      private

      def host
        options.fetch :host
      end

      def username
        options.fetch :username
      end
    end
  end
end
