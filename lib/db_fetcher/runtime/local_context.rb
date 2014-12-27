module DbFetcher
  module Runtime
    class LocalContext < Context
      register_context :local

      def run_command(command)
        DbFetcher.logger.command_start command
        DbFetcher.logger.answer_start :local
        result = %x( #{command} )
        DbFetcher.logger.answer_body result
        DbFetcher.logger.command_finished
      end
    end
  end
end
