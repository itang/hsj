##
# Controllers.
##
require "amethyst/all"
require "./../models"

include Haoshuju::Models

module Haoshuju
  module Controllers
    class WelcomeController < BaseController
      actions :index, :hello, :test

      @@weiboService = WeiboService.new
      @@keywordService = KeywordService.new
      @@languageService = LanguageService.new

      @weibos = [] of Weibo
      @keywords = [] of Keyword

      view "index", "#{__DIR__}/../views/welcome"
      def index
        @name = "Itang"
        @weibos = @@weiboService.find_weibos.to_a
        @keywords = @@keywordService.find_keywords.to_a
        @languages = @@languageService.find_languages.to_a

        respond_to do |format|
          format.html { render "index" }
        end
      end

      def hello
        html "<h1>Hello, world! Haoshuju #{Time.now} : #{Haoshuju::VERSION}"
      end

      def test
        sleep 1
        html "hello"
      end
    end
  end
end
