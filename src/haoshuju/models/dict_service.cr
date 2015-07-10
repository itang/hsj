class Dict
  property id, from, to, from_lang, to_lang, created_at, times

  def initialize
  end

  def initialize(@from: String, @to: String, @from_lang="en": String, @to_lang="cn": String, @created_at="": String, @times=1: Int32)
  end
end

module DictTable
  extend self

  def table_name
    "dicts"
  end

  def ddl_sql
    ["drop table if exists #{table_name}",
    "create table #{table_name}(
      `id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `from` VARCHAR(255) not null,
      `to` varchar(1000) not null,
      `from_lang` varchar(20) not null,
      `to_lang` varchar(20) not null,
      `created_at` varchar(30) not null,
      `times` integer default 0
    )"]
  end

  def init_data
    dict1 = Dict.new "hello", "int. 喂；哈罗", created_at: "2015-07-08 14:58:01"
    dict2 = Dict.new "world", "n. 世界；领域；宇宙；世俗；全人类；物质生活", created_at: "2015-07-08 14:58:02"
    [dict1, dict2]
  end

  def init_data_sql
    init_data.map {|x| as_insert_sql(x)}
  end

  def as_insert_sql(dict: Dict)
    "insert into #{table_name}(`from`, `to`, `from_lang`, `to_lang`, `created_at`, `times`) values ('#{dict.from}', '#{dict.to}', '#{dict.from_lang}', '#{dict.to_lang}', '#{dict.created_at}', #{dict.times})"
  end
end

class DictService
  def save(dict: Dict)
    with_db(&.execute(DictTable.as_insert_sql(dict)))
  end

  def delete(dict: Dict)
  end

  def delete(id: Int32)
  end

  def find_by_id(id: Int32)

  end

  def find_all
    with_db do |db|
      db.query("select * from #{DictTable.table_name} order by id desc").map {|x| row_mapper(x) }
    end
  end

  private def row_mapper(rs)
    Dict.new.tap do |d|
      d.id = t(rs["id"], Int64)
      d.from = t(rs["from"], String)
      d.to = t(rs["to"], String)
      d.from_lang = t(rs["from_lang"], String)
      d.to_lang = t(rs["to_lang"], String)
      d.created_at = t(rs["created_at"], String)
      d.times = t(rs["times"], Int64)
    end
  end

end
