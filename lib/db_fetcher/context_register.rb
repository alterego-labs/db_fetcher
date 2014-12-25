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
    end
  end
end
