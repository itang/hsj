##
# Main Entry
##
require "amethyst"
require "./haoshuju/app"

include Haoshuju

WD = Dir.working_directory
puts "work dir: #{WD}"

app = HaoshujuApp.new(WD)
app.serve 3000
