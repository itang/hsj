class DictController < BaseController
  actions :index, :add_dict!

  @@injector = Haoshuju::Injector.instance

  @dicts = [] of Dict

  view "index", "#{__DIR__}/../views/dict"
  def index
    @dicts = @@injector.dict_service.find_all(Sorter.new("id")) # @@dict_service.find_all([1_i64,2_i64,3_i64])
    respond_to do |format|
      format.html { render "index" }
    end
  end

  def add_dict!
    m = request_body_as_json
    if dict = (Dict.new(m["from"].to_s, m["to"].to_s) if m.is_a?(Hash))
      dict.created_at = Time.now.to_s
      @@injector.dict_service.process_dict!(dict)
    end
    html "ok"
  rescue ex: Exception
    puts ex
    html "error"
  end
end
