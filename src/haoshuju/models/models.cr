require "sqlite3"
require "../libs/simpleorm"

include Haoshuju::Libs::SimpleORM

module Haoshuju
  module Models
    require "./*"
  end
end
