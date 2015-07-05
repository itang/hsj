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
      @languages = Array(Language).new

      view "index", "#{__DIR__}/../views/welcome"
      def index
        @name = "Itang"
        @weibos = @@weiboService.find_weibos
        @keywords = @@keywordService.find_keywords
        @languages = @@languageService.find_languages

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
