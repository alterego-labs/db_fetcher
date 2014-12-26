module DbFetcher
  module Logging
    class Console < Basic
      def write(message, color = :white)
        puts message.send(color)
      end
    end
  end
end
