require "sqlite3"

module Haoshuju
  module Models
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
        if is_new?(t)
          columns = ts.map {|x| "`#{x[0]}`" }.join(", ")
          values = ts.map {|x| wrapper_column_value(x[1])}.join(", ")
          with_db(&.execute("insert into #{table_name} (#{columns}) values (#{values})"))
        else
          updates = ts.map{|x| "#{x[0]} = #{ wrapper_column_value(x[1])}"}.join(", ")
          with_db(&.execute("update #{table_name} set #{updates} where id = #{id_value(t)} "))
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
        with_db(&.execute("delete from #{table_name} where id = #{id}"))
      end

      def find_by_id(id: Int64): T?
        with_db do |db|
          db.query("select * from #{table_name} where id = #{id}")
            .map {|x| row_mapper(x)}
            .first?
        end
      end

      def find_all
        with_db do |db|
          db.query("select * from #{table_name} order by id desc")
            .map {|x| row_mapper(x) }
        end
      end

      private def id_name
        "id"
      end

      private def wrapper_column_value(v)
        case v
        when String
          "'#{v}'"
        when Nil
          "null"
        when Int32, Int64, Float32, Float64, Bool
          v
        else
          "'#{v.to_s}'"
        end
      end
    end

    require "./*"
  end
end
