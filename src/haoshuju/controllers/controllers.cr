require "amethyst/all"
require "./../models"
require "../version"

include Haoshuju::Models

module Haoshuju
  module Controllers
    class BaseController < Base::Controller
      @version = Haoshuju::VERSION
    end

    require "./*"
  end
end
