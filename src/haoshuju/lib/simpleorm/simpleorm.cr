require "sqlite3"
require "../data"

include Haoshuju::Libs::Data

module Haoshuju
  module Libs
    module SimpleORM
      def with_db(&block)
        db = SQLite3::Database.new("data.db")
        begin
          yield db
        rescue ex: Exception
          puts "Exception: #{ex}"
          raise ex
        ensure
          db.close
        end
      end

      def t(v, _type : T.class):T
        if v.is_a?(T)
          v
        end
      end

      class SQLite3::ResultSet
        include Enumerable(SQLite3::ResultSet)
        def each
          while(self.next)
            yield self
          end
          self.close() unless self.closed?
        end
      end

      alias EVType = (String | Bool | Nil | Float64| Int64 )

      abstract class CrudRepository(T, D)

        abstract def ddl_sql : Array(String)

        abstract def auto_ddl!

        abstract def init_data!

        abstract def row_mapper(rs : SQLite3::ResultSet, index : Int32) : T

        abstract def row_unmapper(t : T) : Array(Tuple(String, EVType))

        abstract def table_name : String

        def save!(t : T)
          ts = row_unmapper(t)
          ts = ts.select {|x| x[0] != "id"}
          values = ts.map {|x| x[1] }
          if is_new?(t)
            columns = ts.map {|x| "`#{x[0]}`" }.join(", ")
            cplaceholds = (0...ts.size).map {|x| "?"}.join(", ")

            sql = "insert into #{table_name} (#{columns}) values (#{cplaceholds})"
            puts "DEBUG save sql: #{sql} #{values}"

            with_db(&.execute(sql, values))
          else
            cplaceholds = ts.map {|x| f = wrap_field_name(x[0]); "#{f} = ?" }.join(", ")
            values << id_value(t)

            sql = "update #{table_name} set #{cplaceholds} where id = ?"
            puts "DEBUG update sql: #{sql} #{values}"

            with_db(&.execute(sql, values))
          end
        end

        def save!(ts : Array(T))
          ts.map {|t| save!(t)}
        end

        def id_value(t : T) : D?
          if t.responds_to? :id
            t.id as D?
          end
        end

        def is_new?(t : T): Bool
          if t.responds_to? :id
            t.id.nil?
          else
            raise "NOT Entity Instance!"
          end
        end

        def delete!(t : T)
          id = id_vaue(t)
          if id
            delete_by_id(id)
          end
        end

        def delete!(ts : Array(T))
          ts.map {|t| delete!(t)}
        end

        def delete!(id : D)
          with_db(&.execute("delete from #{table_name} where id = ?", id))
        end

        def exists(id : D)
          !find_by_id(id).nil?
        end

        def find_by_id(id : D): T?
          find_one("select * from #{table_name} where id = ?", [id])
        end

        def find_one(sql, values): T?
          find_by_sql(sql, values)
            .map_with_index {|x, i| row_mapper(x, i)}
            .first?
        end

        def find_one_by_property(field, value): T?
          wfield = wrap_field_name(field)
          find_one("select * from #{table_name} where #{wfield} = ?", [value])
        end

        def find_all
          find_by_sql("select * from #{table_name} order by id desc").map_with_index {|x, i| row_mapper(x, i) }
        end

        def find_all(pager : Pager): Page
          total = count()

          psql = pager_to_sql(pager)
          sql = "select * from #{table_name} #{psql[0]}"
          values = psql[1]
          items = find_by_sql(sql, values).map_with_index {|x, i| row_mapper(x, i) }

          Page.new(total, items, pager)
        end

        def find_all(sorter : Sorter): Array(T)
          total = count()

          ssql = sorter_to_sql(sorter)
          sql = "select * from #{table_name} #{ssql}"
          find_by_sql(sql).map_with_index {|x, i| row_mapper(x, i) }
        end

        def find_all(ids : Array(Int64)): Array(T)
          find_by_sql("select * from #{table_name} where id in (#{array_as_inclause(ids)})").map_with_index {|x, i| row_mapper(x, i) }
        end

        def count_by_sql(sql)
          total =  find_by_sql(sql).map {|x| x[0] }.first?
          if total
            t(total, Int64).not_nil!
          else
            0_i64
          end
        end

        private def array_as_inclause(arr : (Array(Int64) | Array(String)))
          if typeof(arr) == Array(32)
            arr.map(&.to_s).join(", ")
          else
            arr.map{|x| quote_str(x)}.join(", ")
          end
        end

        private def wrap_field_name(name)
          "`#{name}`"
        end

        private def count(): Int64
          count_by_sql "select count(*) as total FROM #{table_name}"
        end

        private def find_by_sql(sql)
          puts "DEBUG: sql '#{sql}'"
          with_db(&.query(sql))
        end

        private def find_by_sql(sql, values)
          puts "DEBUG: sql '#{sql}' #{values}"
          with_db(&.query(sql, values))
        end

        private def wrap_field_falue(v : String): String
          v.gsub(/'/, "''")
        end

        private def quote_str(s)
          "'#{s}'"
        end

        private def pager_to_sql(pager)
          {"ORDER BY #{wrap_field_falue(pager.sorter.sort)} #{pager.sorter.dir.to_s} LIMIT ?, ?", [pager.starts.to_i, pager.size.to_i]}
        end

        private def sorter_to_sql(sorter)
          "ORDER BY #{wrap_field_falue(sorter.sort)} #{sorter.dir.to_s}"
        end

        private def id_name
          "id"
        end
      end
    end
  end
end
