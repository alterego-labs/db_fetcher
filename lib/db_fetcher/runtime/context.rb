module DbFetcher
  module Runtime
    class Context
      def self.register_context(code)
        DbFetcher::ContextRegister.add code
      end
    end
  end
end
