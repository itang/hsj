##
# Main Entry
##
require "amethyst"
require "./haoshuju/app"
require "./haoshuju/middlewares"
require "./haoshuju/utils"

require "./haoshuju/runtime"

include Haoshuju

WD = Dir.current
PORT = ENV["PORT"]?.try &.to_i || 3000
RUN_MODE = Runtime.run_mode # development | production
APPPATH = File.expand_path($0)
puts "$0: #{$0}, app_path: #{APPPATH}, work dir: #{WD}, port: #{PORT}, run mode: #{RUN_MODE}"

if Runtime.dev? || ENV["MOCK_REDIS"]? == "true"
  puts "INFO: Start mock Redis server..."
  fork do
    begin
      system "redis-server"
    rescue ex : Exception
      puts "WARN: #{ex}"
    end
  end
end

App.settings.configure do |conf|
  conf.environment = RUN_MODE
  conf.static_dirs = ["/assets"]
end

App.use Middlewares::XRuntimeMiddleware
App.use Middlewares::ApiAuthMiddleware

app = HaoshujuApp.new(WD)

puts "app_dir: #{App.settings.app_dir}"
puts "environment: #{App.settings.environment}"
puts "namespace: #{App.settings.namespace}"
puts "static_dirs: #{App.settings.static_dirs}"

Util::Pids.new.write_file!

app.serve PORT
