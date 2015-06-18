##
# Main Entry
##
require "amethyst"
require "./haoshuju/app"

include Haoshuju

WD = Dir.working_directory
PORT = ENV.has_key?("PORT") ? ENV["PORT"].to_i : 3000
RUN_MODE = ENV.has_key?("RUN_MODE") ? ENV["RUN_MODE"] : "production" # development | production
APPPATH = File.expand_path($0)
puts "$0: #{$0}, app_path: #{APPPATH}, work dir: #{WD}, port: #{PORT}, run mode: #{RUN_MODE}"

App.settings.configure do |conf|
  conf.environment = RUN_MODE
end

app = HaoshujuApp.new(APPPATH)
app.serve PORT
