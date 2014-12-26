module DbFetcher
  module Logging
    class Console < Basic
      def step_start(name)
        write "  * #{formatted_now} => Currently executing #{name}", :green
      end

      def write(message, color = :white)
        puts message.send(color)
      end

      private

      def formatted_now
        DateTime.now.strftime '%e %b %Y %H:%M:%S%p'
      end
    end
  end
end
