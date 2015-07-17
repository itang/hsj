class ToolController < BaseController
  actions :migrate!

  @@dict_service = DictService.new
  def migrate!
    with_db do |db|
      puts "INFO: #{@@dict_service.ddl_sql}"
      @@dict_service.auto_ddl!

      puts "INFO: init data"
      @@dict_service.init_data!
    end

    html("finish")
  end
end
