class WelcomeController < BaseController
  actions :index

  @@weibo_service = WeiboService.new
  @@keyword_service = KeywordService.new
  @@language_service = LanguageService.new
  @@read_service = ReadService.new
  @@dict_service = DictService.new

  @weibos = [] of Weibo
  @keywords = [] of Keyword
  @languages = Array(Language).new
  @reads = [] of Read
  @dicts = Page.new(0_i64, [] of Dict, Pager.new)

  view "index", "#{__DIR__}/../views/welcome"
  def index
    @name = "Itang"
    @weibos = @@weibo_service.find_weibos
    @keywords = @@keyword_service.find_keywords
    @languages = @@language_service.find_languages
    @reads = @@read_service.find_reads
    @build_time = get_build_time
    @dicts = @@dict_service.find_page(Pager.new())

    respond_to do |format|
      format.html { render "index" }
    end
  end

  private def get_build_time
    file = ".build"
    File.exists?(file) ? File.read(file) : "Unknown"
  end
end
