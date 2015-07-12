class ToolController < BaseController
  actions :migrate!

  def migrate!
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
end
