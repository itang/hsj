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

    class SQLite3::ResultSet
      include Enumerable(SQLite3::ResultSet)
      def each
        while(self.next)
          yield self
        end
      end
    end

    require "./*"
  end
end
