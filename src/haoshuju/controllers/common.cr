##
# Controllers.
##
require "amethyst/all"
require "./../version"

module Haoshuju
  module Controllers
    class BaseController < Base::Controller
      @version = Haoshuju::VERSION
    end
  end
end
