class WelcomeController < BaseController
  actions :index

  @weibos = [] of Weibo
  @keywords = [] of Keyword
  @languages = Array(Language).new
  @reads = [] of Read
  @dicts = Page.new(0_i64, [] of Dict, Pager.new)
  @pv = PageCounter.new(0, 0)

  view "index", "#{__DIR__}/../views/welcome"
  def index
    @name = "Itang"
    @weibos = injector.weibo_service.find_weibos
    @keywords = injector.keyword_service.find_keywords
    @languages = injector.language_service.find_languages
    @reads = injector.read_service.find_reads
    @dicts = injector.dict_service.find_all(Pager.new)
    @build_time = get_build_time
    @pv = injector.counter_service.incr_pv("index")

    respond_to do |format|
      format.html { render "index" }
    end
  end

  private def get_build_time
    file = ".build"
    File.exists?(file) ? File.read(file) : "Unknown"
  end
end
