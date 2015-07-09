require "json"

class WelcomeController < BaseController
  actions :index, :migrate, :add_dict!

  @@weiboService = WeiboService.new
  @@keywordService = KeywordService.new
  @@languageService = LanguageService.new
  @@readService = ReadService.new
  @@dict_service = DictService.new

  @weibos = [] of Weibo
  @keywords = [] of Keyword
  @languages = Array(Language).new
  @reads = [] of Read
  @dicts = [] of Dict

  view "index", "#{__DIR__}/../views/welcome"
  def index
    @name = "Itang"
    @weibos = @@weiboService.find_weibos
    @keywords = @@keywordService.find_keywords
    @languages = @@languageService.find_languages
    @reads = @@readService.find_reads
    @build_time = get_build_time
    @dicts = @@dict_service.find_all

    respond_to do |format|
      format.html { render "index" }
    end
  end

  def add_dict!
    if body = request.body
      begin
        m = JSON.parse(body)
        dict = Dict.new(m["from"].to_s, m["to"].to_s) if m.is_a?(Hash)
        if dict
          dict.created_at = Time.now.to_s
          @@dict_service.save(dict)
        end
      rescue ex: Exception
        puts ex
        html "error"
        return
      end
    end

    html "ok"
  end

  def migrate
    with_db do |db|
      puts "INFO: #{DictTable.ddl_sql}"
      DictTable.ddl_sql.each do |x|
        db.execute(x)
      end

      puts "INFO: #{DictTable.init_data_sql}"
      DictTable.init_data_sql.each do |x|
        db.execute(x)
      end
    end

    html("finish")
  end

  private def get_build_time
    file = ".build"
    File.exists?(file) ? File.read(file) : "Unknown"
  end
end
