class ToolController < BaseController
  actions :migrate!, :ping, :timeout

  @@injector = Haoshuju::Injector.instance

  def migrate!
    with_db do |db|
      puts "INFO: #{@@injector.dict_service.ddl_sql}"
      @@injector.dict_service.auto_ddl!

      puts "INFO: init data"
      @@injector.dict_service.init_data!
    end

    html("finish")
  end

  def ping
    text "pong"
  end

  def timeout
    t = get_int("t", 5)
    if t > 20
      text "invalid params['t'] = #{t} > 20."
    else
      sleep(t)
      text "finish after #{t} secs."
    end
  end

  private def get_int(k, d)
    if params.has_key?(k)
      params[k].to_i
    else
      d
    end
  rescue e
    puts e
    d
  end
end
