module DbFetcher
  module Logging
    class Console < Basic
      def step_start(name)
        write "  * #{formatted_now} => Currently executing #{name}", :green
      end

      def command_start(command)
        write "  * executing `#{command}`", :yellow
      end

      def answer_start(server)
        write "    [#{server}] answer:"
      end

      def answer_body(answer)
        write "    #{answer}"
      end

      def command_finished
        write "    finished on #{formatted_now}"
      end

      def updown_progress(percent)
        write_with_back "    progress: #{percent}% completed"
      end

      def write(message, color = :white)
        return if silently?
        puts message.send(color)
      end

      def write_with_back(message, color = :white)
        return if silently?
        print message.send(color)
        print 13.chr
      end

      private

      def formatted_now
        DateTime.now.strftime '%e %b %Y %H:%M:%S%p'
      end
    end
  end
end
