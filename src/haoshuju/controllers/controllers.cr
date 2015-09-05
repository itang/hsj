require "json"
require "amethyst/all"
require "./../models"
require "../version"
require "../injector"


include Haoshuju::Models

module Haoshuju
  module Controllers
    abstract class BaseController < Base::Controller
      @version = Haoshuju::VERSION

      def initialize
        super
        puts "DEBUG: BaseController initialize"
      end

      def request_body_as_json
        if body = request.body
          JSON.parse body
        end
      end

      protected def injector
        Haoshuju::Injector.instance
      end
    end
  end
end

require "./*"
