##
# Main Entry
##
require "amethyst"
require "./haoshuju/app"

include Haoshuju

WD = Dir.working_directory
PORT = ENV.has_key?("PORT") ? ENV["PORT"].to_i : 3000
puts "work dir: #{WD}, port: #{PORT}"

app = HaoshujuApp.new(WD)
app.serve PORT
