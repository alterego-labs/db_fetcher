require 'colorize'

module DbFetcher
  module Logging
    class Basic
      def initialize(opts = {})
        @silent = opts.fetch :silent, false
      end

      def silently?
        @silent
      end
    end
  end
end
