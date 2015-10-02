require "./models"

include Haoshuju::Models

module Haoshuju
  class Injector
    @@instance = Injector.new

    getter weibo_service, keyword_service, language_service, read_service, dict_service, counter_service

    @weibo_service = WeiboService.new
    @keyword_service = KeywordService.new
    @language_service = LanguageService.new
    @read_service = ReadService.new
    @dict_service = DictService.new

    @counter_service = CounterService.new

    private def initialize
    end

    def self.instance
      @@instance
    end
  end
end
