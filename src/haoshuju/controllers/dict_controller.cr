class DictController < BaseController
  actions :index, :add_dict!

  @@dict_service = DictService.new

  def index
    html "dict index"
  end

  def add_dict!
    m = request_body_as_json
    if dict = (Dict.new(m["from"].to_s, m["to"].to_s) if m.is_a?(Hash))
      dict.created_at = Time.now.to_s
      @@dict_service.save(dict)
    end
    html "ok"
  rescue ex: Exception
    puts ex
    html "error"
  end
end
