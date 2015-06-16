##
# Main Entry
##
require "amethyst"
require "./haoshuju/app"

include Haoshuju

WD = Dir.working_directory
PORT = ENV.has_key?("PORT") ? ENV["PORT"].to_i : 3000
APPPATH = File.expand_path($0)
puts "$0: #{$0}, app_path: #{APPPATH}, work dir: #{WD}, port: #{PORT}"

app = HaoshujuApp.new(APPPATH)
app.serve PORT
