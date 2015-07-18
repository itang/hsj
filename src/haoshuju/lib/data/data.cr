module Haoshuju::Libs::Data
  enum Dir
    ASC
    DESC

    def asc?
      self == Dir::ASC
    end
  end

  class Sorter
    getter sort, dir

    def initialize(@sort="id" : String,
                   @dir=Dir::DESC : Dir)
    end
  end

  class Pager
    getter page, limit, sorter

    def initialize(@page=1_u32 : UInt32,
                   @limit=10_u32 : UInt32,
                   @sorter=Sorter.new : Sorter)
    end

    alias_method size, limit

    def starts
      (page - 1) * limit
    end

    def ends
      starts + limit - 1
    end
  end

  class Page(T)
    getter pager, total, items

    def initialize(@total : Int64,
                   @items : Array(T),
                   @pager : Pager)
    end
  end
end
