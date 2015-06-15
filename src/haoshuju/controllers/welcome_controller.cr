##
# Controllers.
##
require "amethyst/all"
require "./../version"
require "./../models"

include Haoshuju::Models

module Haoshuju
  module Controllers
    class WelcomeController < Base::Controller
      actions :index, :hello

      @weibos = WeiboService.new

      view "index", "#{__DIR__}/../views/welcome", name, weibos
      def index
        name = "Itang"
        weibos = @weibos.find_weibos
        respond_to do |format|
          format.html { render "index", name, weibos.to_a}
        end
      end

      def hello
        html "<h1>Hello, world! Haoshuju #{Time.now} : #{Haoshuju::VERSION}"
      end
    end
  end
end
