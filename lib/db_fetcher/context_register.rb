module DbFetcher
  class ContextRegister
    class << self
      attr_reader :contexts

      def contexts
        @contexts || []
      end

      def add(code)
        @contexts ||= []
        @contexts << code
      end

      def get(code)
        contexts_instances[code]
      end

      def contexts_instances
        @_contexts_instances ||= @contexts.inject({}) do |hash, code|
          hash[code] = ContextInitializer.new(code).create; hash
        end
      end

      def clear
        @contexts = []
      end

      class ContextInitializer < Struct.new(:code)
        def create
          constantize.new
        end

        private

        def classify
          code.to_s.split('_').collect(&:capitalize).join
        end

        def constantize
          eval "DbFetcher::Runtime::#{classify}Context"
        end
      end
    end
  end
end
