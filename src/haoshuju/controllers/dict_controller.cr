
class TestController < BaseController
  actions :add_dict!

  @@dict_service = DictService.new

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
end
