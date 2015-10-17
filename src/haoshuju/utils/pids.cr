require "process"

module Haoshuju
  module Util
    class Pids
      getter file

      def initialize(@file = "app.pid")
        at_exit do
          self.delete_file!
        end
      end

      def write_file!
        File.write(@file, Process.pid)
        puts "INFO: write to #{@file}"
      end

      def delete_file!
        File.delete @file
        puts "INFO: delete #{@file}"
      end
    end
  end
end
