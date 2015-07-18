class DictController < BaseController
  actions :index, :add_dict!

  @@dict_service = DictService.new

  @dicts = [] of Dict

  view "index", "#{__DIR__}/../views/dict"
  def index
    @dicts = @@dict_service.find_all
    respond_to do |format|
      format.html { render "index" }
    end
  end

  def add_dict!
    m = request_body_as_json
    if dict = (Dict.new(m["from"].to_s, m["to"].to_s) if m.is_a?(Hash))
      dict.created_at = Time.now.to_s
      @@dict_service.save!(dict)
    end
    html "ok"
  rescue ex: Exception
    puts ex
    html "error"
  end
end
