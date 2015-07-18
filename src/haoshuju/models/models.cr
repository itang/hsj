require "sqlite3"
require "../lib/simpleorm"

include Haoshuju::Libs::SimpleORM

module Haoshuju
  module Models
    require "./*"
  end
end
