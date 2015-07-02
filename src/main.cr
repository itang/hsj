##
# Main Entry
##
require "amethyst"
require "./haoshuju/app"
require "./haoshuju/middlewares"
require "./haoshuju/utils"

include Haoshuju

WD = Dir.working_directory
PORT = ENV.has_key?("PORT") ? ENV["PORT"].to_i : 3000
RUN_MODE = ENV.has_key?("RUN_MODE") ? ENV["RUN_MODE"] : "production" # development | production
APPPATH = File.expand_path($0)
puts "$0: #{$0}, app_path: #{APPPATH}, work dir: #{WD}, port: #{PORT}, run mode: #{RUN_MODE}"

App.settings.configure do |conf|
  conf.environment = RUN_MODE
  conf.static_dirs = ["/assets"]
end

App.use Middlewares::XRuntimeMiddleware

app = HaoshujuApp.new(WD)

puts "app_dir: #{App.settings.app_dir}"
puts "environment: #{App.settings.environment}"
puts "namespace: #{App.settings.namespace}"
puts "static_dirs: #{App.settings.static_dirs}"

Util::Pids.new.write_file!

app.serve PORT
