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

      def t(v, _type: T.class):T
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
        end
      end

      alias EVType = (String | Bool | Nil | Float64| Int64 )

      abstract class CrudRepository(T)

        abstract def ddl_sql : Array(String)

        abstract def auto_ddl!

        abstract def init_data!

        abstract def row_mapper(rs: SQLite3::ResultSet) : T

        abstract def unapply(t: T) : Array(Tuple(String, EVType))

        abstract def table_name: String

        def save!(t: T)
          ts = unapply(t)
          ts = ts.select {|x| x[0] != "id"}
          values = ts.map {|x| x[1] }
          if is_new?(t)
            columns = ts.map {|x| "`#{x[0]}`" }.join(", ")
            cplaceholds = (0...ts.length).map {|x| "?"}.join(", ")

            sql = "insert into #{table_name} (#{columns}) values (#{cplaceholds})"
            puts "DEBUG save sql: #{sql} #{values}"

            with_db(&.execute(sql, values))
          else
            cplaceholds = ts.map {|x| "#{x[0]} = ?" }.join(", ")
            values << id_value(t)

            sql = "update #{table_name} set #{cplaceholds} where id = ?"
            puts "DEBUG update sql: #{sql} #{values}"

            with_db(&.execute(sql, values))
          end
        end

        def id_value(t: T) : Int64?
          if t.responds_to? :id
            t.id as Int64?
          end
        end

        def is_new?(t: T)
          if t.responds_to? :id
            t.id.nil?
          else
            raise "NOT Entity Instance!"
          end
        end

        def delete!(t: T)
          id = id_vaue(t)
          if id
            delete_by_id(id)
          end
        end

        def delete_by_id!(id: Int64)
          with_db(&.execute("delete from #{table_name} where id = ?", id))
        end

        def find_by_id(id: Int64): T?
          with_db(&.query("select * from #{table_name} where id = ?", id)
                   .map {|x| row_mapper(x) }
                   .first?)
        end

        def find_all
          find_by_sql("select * from #{table_name} order by id desc").map {|x| row_mapper(x) }
        end

        def find_page(pager: Pager): Page
          total = count()

          psql = pager_to_sql(pager)
          sql = "select * from #{table_name} #{psql[0]}"
          values = psql[1]

          items = find_by_sql(sql, values).map {|x| row_mapper(x) }
          Page.new(total, items, pager)
        end

        def count_by_sql(sql)
          total =  find_by_sql(sql).map {|x| x[0] }.first?
          if total
            t(total, Int64).not_nil!
          else
            0_i64
          end
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

        private def wrap_field(v: String): String
          v.gsub(/'/, "''")
        end

        private def pager_to_sql(pager)
          {"ORDER BY #{wrap_field(pager.sorter.sort)} #{pager.sorter.dir.to_s} LIMIT ?, ?", [pager.starts.to_i, pager.size.to_i]}
        end

        private def id_name
          "id"
        end
      end
    end
  end
end
