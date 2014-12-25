module DbFetcher
  module Runtime
    class LocalContext < Context
      register_context :local

      def run_command(command)
        system command
      end
    end
  end
end
